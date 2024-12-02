// /lib/features/products/data/models/product_model.dart
class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String categoryName;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.categoryName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      price: json['price'],
      stock: json['stock'],
      categoryName: json['categoryName'] ?? '',
    );
  }
}
