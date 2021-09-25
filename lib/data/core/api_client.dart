import 'dart:convert';

import 'package:code_test_datacom_albums/data/core/api_constans.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  dynamic get(String path, {Map<String, dynamic>? params}) async {
    final response =
        await dio.get(ApiConstants.BASE_URL + path, queryParameters: params);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
