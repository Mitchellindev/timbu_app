// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:timbu_app/data/models/product_model.dart';
import 'package:timbu_app/data/providers/product_provider.dart';

abstract class IProductRepository {
  Future<ProductModel> getProducts();
}

class ProductRepository implements IProductRepository {
  final ProductProvider productProvider;
  ProductRepository({
    required this.productProvider,
  });

  @override
  Future<ProductModel> getProducts() {
    return productProvider.getProducts();
  }
}
