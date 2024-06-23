import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")

        products.get(use: self.index)
        products.post(use: self.create)
        // products.group(":productID") { product in
        //     products.delete(use: self.delete)
        //     products.put(use: self.update)
        // }
        products.delete(":productID", use: self.delete)
        products.put(":productID", use: self.update)
    }

    @Sendable
    func index(req: Request) async throws -> [ProductDTO] {
        try await Product.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> ProductDTO {
        let product = try req.content.decode(ProductDTO.self).toModel()

        try await product.save(on: req.db)
        return product.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {

        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await product.delete(on: req.db)
        return .noContent
    }

    @Sendable
    func update(req: Request) async throws -> ProductDTO {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await product.delete(on: req.db)

        let newProduct = try req.content.decode(ProductDTO.self).toModel()

        newProduct.id = req.parameters.get("productID")

        try await newProduct.save(on: req.db)
        return newProduct.toDTO()
    }
}
