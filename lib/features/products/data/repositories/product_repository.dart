// /lib/features/products/data/repositories/product_repository.dart
import 'package:online_shopping/features/products/data/datasources/product_datasource.dart';
import 'package:online_shopping/features/products/domain/entities/product.dart';

class ProductRepository {
  final ProductRemoteDatasource datasource;

  ProductRepository({required this.datasource});

  Future<List<Product>> getAllProducts() async {
    final productModels = await datasource.getAllProducts();
    return productModels
        .map((productModel) => Product(
              id: productModel.id,
              name: productModel.name,
              description: productModel.description,
              price: productModel.price,
              stock: productModel.stock,
              categoryName: productModel.categoryName,
            ))
        .toList();
  }

  // Método para crear un producto
  Future<void> createProduct(String name, String description, double price,
      int stock, String categoryName) async {
    await datasource.createProduct(
        name, description, price, stock, categoryName);
  }

// Método para editar un producto
  Future<void> updateProduct(
      int id, String name, String description, double price, int stock) async {
    print('Iniciando la edición del producto con ID: $id');
    await datasource.updateProduct(id, name, description, price, stock);
    print('Producto con ID: $id actualizado correctamente');
  }

  // Eliminar un producto
  Future<void> deleteProduct(int id) async {
    print(
        'Se está procesando la eliminación del producto con ID: $id desde el repositorio.');
    await datasource.deleteProduct(id);
    print(
        'La eliminación del producto con ID: $id fue procesada desde el repositorio.');
  }
}
