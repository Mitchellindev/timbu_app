import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String _apiKey = dotenv.env['API_KEY']!;
String _baseUrl = dotenv.env['BASE_URL']!;
String _organisationId = dotenv.env['ORGANISATION_ID']!;
String _appId = dotenv.env['APP_ID']!;
Future<Map<String, dynamic>> getProducts() async {
  try {
    final res = await http.get(
      Uri.parse(
        '$_baseUrl/products?organization_id=$_organisationId&Appid=$_appId&Apikey=$_apiKey',
      ),
    );

    final data = jsonDecode(res.body);
    if (res.statusCode != 200) {
      throw 'An unexpected error occurred';
    }
    return data;
  } catch (e) {
    throw e.toString();
  }
}
