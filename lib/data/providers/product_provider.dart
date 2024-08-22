import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timbu_app/data/models/product_model.dart';
import 'package:timbu_app/network/api_endpoint.dart';
import 'package:timbu_app/network/dio_client.dart';

String _baseUrl = dotenv.env['BASE_URL'] ?? '';
String _apiKey = dotenv.env['API_KEY'] ?? '';
String _organisationId = dotenv.env['ORGANISATION_ID'] ?? '';
String _appId = dotenv.env['APP_ID'] ?? '';

class ProductProvider {
  Future<ProductModel> getProducts() async {
    try {
      final res = await DioClient.instance.get(queryParameters: {
        "Appid": _appId,
        "organization_id": _organisationId,
        "Apikey": _apiKey
      }, path: RoutesAndPaths.products);
      print(res);
      return ProductModel.fromJson(res);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
