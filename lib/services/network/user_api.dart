import 'dart:convert';
import 'dart:io';
import 'package:app/services/network/api_common.dart';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';

/*
Localhost on ios emulator: 127.0.0.1
Localhost on android emulator: 10.0.2.2
 */

class UserApiClient {
  late String baseUrl;

  UserApiClient() {
    baseUrl = BackendEndpoints().getBaseUrl();
  }

  Future<ApiResponse<http.Response>> login(
      String username, String password) async {
    var url = Uri.parse("$baseUrl$kBackendUserLogin");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'email': username, 'password': password}),
    );

    int statusCode = response.statusCode;
    bool success = response.statusCode >= 200 && response.statusCode < 300;
    var data = User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return ApiResponse(
        data: data,
        success: success,
        errorMessage: success ? '' : 'Login failed',
        statusCode: statusCode);
  }

  Future<ApiResponse<http.Response>> testToken(String jwt) async {
    var url = Uri.parse("$baseUrl$kBackendUserTestJwt");
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
    );

    int statusCode = response.statusCode;
    bool success = response.statusCode >= 200 && response.statusCode < 300;

    return ApiResponse(
        data: null,
        success: success,
        errorMessage: success ? '' : 'Invalid token',
        statusCode: statusCode);
  }

  Future<ApiResponse<http.Response>> auth(String jwt) async {
    var url = Uri.parse("$baseUrl$kBackendUserTestAuth");
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
    );

    int statusCode = response.statusCode;
    bool success = response.statusCode >= 200 && response.statusCode < 300;
    var data = User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return ApiResponse(
        data: data,
        success: success,
        errorMessage: success ? '' : 'Login failed',
        statusCode: statusCode);
  }
}
