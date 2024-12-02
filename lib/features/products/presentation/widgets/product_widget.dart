// /lib/features/products/presentation/widgets/product_widget.dart
import 'package:flutter/material.dart';
import 'package:online_shopping/features/products/domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price}'),
    );
  }
}
