package com.example.zadanie3.controller

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
class MainController {

    @GetMapping("/")
    fun index():ResponseEntity<String> {
        return ResponseEntity.ok().body("<h1>Hello, World!</h1><a href=\"/users\"><h2>users</h2></a>")
    }

    data class User(val login: String, val password: String)

    private val userList = listOf(
        User("user1", "password1"),
        User("user2", "password2"),
        User("admin", "12345"),
        User("root", "qwerty")
    )

    @GetMapping("/users")
    fun getUsers(): List<User> {
        return userList
    }

}
