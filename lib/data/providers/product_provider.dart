import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timbu_app/data/models/product_model.dart';

String _baseUrl = dotenv.env['BASE_URL'] ?? '';
String _apiKey = dotenv.env['API_KEY'] ?? '';
String _organisationId = dotenv.env['ORGANISATION_ID'] ?? '';
String _appId = dotenv.env['APP_ID'] ?? '';

class ProductProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: '$_baseUrl'));

  Future<ProductModel> getProducts() async {
    try {
      final res = await _dio.get(
          "/products?organization_id=$_organisationId&Appid=$_appId&Apikey=$_apiKey");
      return productModelFromJson(res.toString());
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
