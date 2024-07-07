import 'package:flutter/material.dart';
import 'package:timbu_app/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: CachedNetworkImage(
      //   imageUrl: product.image,
      //   placeholder: (context, url) => CircularProgressIndicator(),
      //   errorWidget: (context, url, error) => Icon(Icons.error),
      // ),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text(
          '₦${product.price.toStringAsFixed(2)}'), // Display price with 2 decimal places
    );
  }
}
