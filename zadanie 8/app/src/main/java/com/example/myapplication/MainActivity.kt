package com.example.myapplication

import StringListAdapter
import android.os.Bundle
import android.text.TextUtils
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.ListView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {

    private lateinit var editTextProduct: EditText
    private lateinit var editTextCategory: EditText
    private lateinit var buttonAddProduct: Button
    private lateinit var buttonAddCategory: Button
    private lateinit var listViewProduct: ListView
    private lateinit var listViewCategory: ListView

    private lateinit var productAdapter: ArrayAdapter<String>
    private lateinit var categoryAdapter: ArrayAdapter<String>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        editTextProduct = findViewById(R.id.editTextProduct)
        editTextCategory = findViewById(R.id.editTextCategory)
        buttonAddProduct = findViewById(R.id.buttonAddProduct)
        buttonAddCategory = findViewById(R.id.buttonAddCategory)
        listViewProduct = findViewById(R.id.listViewProduct)
        listViewCategory = findViewById(R.id.listViewCategory)

        val categoryList = mutableListOf("Category 1", "Category 2")
        val productList = mutableListOf("Product 1", "Product 2", "Product 3")

        productAdapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, productList)
        categoryAdapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, categoryList)

        listViewProduct.adapter = productAdapter
        listViewCategory.adapter = categoryAdapter

        buttonAddProduct.setOnClickListener {
            val productName = editTextProduct.text.toString()
            if (!TextUtils.isEmpty(productName)) {
                productAdapter.add(productName)
                productAdapter.notifyDataSetChanged()
                editTextProduct.text.clear()
            }

        }

        buttonAddCategory.setOnClickListener {
            val categoryName = editTextCategory.text.toString()
            if (!TextUtils.isEmpty(categoryName)) {
                categoryAdapter.add(categoryName)
                categoryAdapter.notifyDataSetChanged()
                editTextCategory.text.clear()
            }

        }
    }
}