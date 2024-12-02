// /lib/features/products/data/datasources/product_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shopping/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getAllProducts();

  createProduct(String name, String description, double price, int stock,
      String categoryName) {}

  deleteProduct(int id) {}

  updateProduct(
      int id, String name, String description, double price, int stock) {}
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final http.Client client;

  ProductRemoteDatasourceImpl({required this.client});

  // Get all products
  Future<List<ProductModel>> getAllProducts() async {
    final response =
        await client.get(Uri.parse('http://localhost:8280/api/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Método para crear un nuevo producto
  Future<void> createProduct(String name, String description, double price,
      int stock, String categoryName) async {
    final response = await client.post(
      Uri.parse('http://localhost:8280/api/products'),
      body: json.encode({
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
        'categoryName': categoryName,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to create product');
    }
  }

  // Método para editar un producto
  Future<void> updateProduct(
      int id, String name, String description, double price, int stock) async {
    print('Intentando editar el producto con ID: $id');
    final response = await client.put(
      Uri.parse('http://localhost:8280/api/products/$id'),
      body: json.encode({
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Error al editar el producto con ID: $id');
    }
    print('Producto con ID: $id editado con éxito');
  }

  // Eliminar un producto
  Future<void> deleteProduct(int id) async {
    print('Intentando eliminar el producto con ID: $id');
    final response = await client.delete(
      Uri.parse('http://localhost:8280/api/products/$id'),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Producto con ID $id eliminado con éxito.');
    } else {
      final errorMessage =
          'Error al eliminar el producto con ID $id. Código de estado: ${response.statusCode}';
      print(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
