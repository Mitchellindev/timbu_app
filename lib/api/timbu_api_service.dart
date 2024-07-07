import 'package:dio/dio.dart';
import 'package:timbu_app/models/product_model.dart';

class TimbuApiService {
  final String _baseUrl = 'https://api.timbu.cloud';
  final String _organizationId =
      'YOUR_ORGANIZATION_ID'; // Replace with your Timbu organization ID
  final String _appId = 'YOUR_APP_ID'; // Replace with your Timbu App ID
  final String _apiKey = 'YOUR_API_KEY'; // Replace with your Timbu API key

  Future<List<ProductModel>> getProducts() async {
    final dio = Dio();
    final queryParams = {
      'organization_id': _organizationId,
      'Appid': _appId,
      'Apikey': _apiKey,
    };

    try {
      final response =
          await dio.get('$_baseUrl/products', queryParameters: queryParams);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          // Check if response is a list of products
          return data.map((product) => ProductModel.fromJson(product)).toList();
        } else if (data is Map) {
          // Check if response is a single product object
          return [];
          // [
          //   ProductModel.fromJson(data)
          // ]
          // Wrap in a list for consistency
        } else {
          throw Exception('Unexpected response format from Timbu API');
        }
      } else {
        throw Exception(
            'Failed to get products (Status Code: ${response.statusCode})');
      }
    } on DioError catch (error) {
      throw Exception('Error during API request: ${error.message}');
    }
  }
}
