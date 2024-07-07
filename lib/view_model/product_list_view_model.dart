import 'package:flutter/foundation.dart';
import 'package:timbu_app/models/product_model.dart';
import 'package:timbu_app/api/timbu_api_service.dart';

class ProductListViewModel extends ChangeNotifier {
  final TimbuApiService _timbuApiService = TimbuApiService();
  List<ProductModel> _products = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    try {
      final fetchedProducts = await _timbuApiService.getProducts();
      _products = fetchedProducts;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
