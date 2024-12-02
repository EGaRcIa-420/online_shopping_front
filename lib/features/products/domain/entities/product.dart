// /lib/features/products/domain/entities/product.dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String categoryName;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.categoryName,
  });
}
