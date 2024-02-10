import 'dart:async';
import 'dart:convert';
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
    var url = Uri.parse('$baseUrl$kBackendUserLogin');
    try {
      var response = await http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'email': username, 'password': password}),
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        // Handle the timeout here
        throw TimeoutException('The connection has timed out!');
      });

      int statusCode = response.statusCode;
      bool success = response.statusCode >= 200 && response.statusCode < 300;

      User? data;
      if (success) {
        data = User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        data = null;
      }

      return ApiResponse(
          data: data,
          success: success,
          errorMessage: success ? '' : 'Login failed',
          statusCode: statusCode);
    } on TimeoutException {
      return ApiResponse(
          data: null,
          success: false,
          errorMessage: 'The connection has timed out!',
          statusCode: 408);
    }
  }

  Future<ApiResponse<http.Response>> testToken(String jwt) async {
    var url = Uri.parse('$baseUrl$kBackendUserTestJwt');
    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwt',
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        // Handle the timeout here
        throw TimeoutException('The connection has timed out!');
      });

      int statusCode = response.statusCode;
      bool success = response.statusCode >= 200 && response.statusCode < 300;
      var data =
          User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      return ApiResponse(
          data: data,
          success: success,
          errorMessage: success ? '' : 'Invalid token',
          statusCode: statusCode);
    } catch (e) {
      return ApiResponse(
          data: null,
          success: false,
          errorMessage: 'The connection has timed out!',
          statusCode: 408);
    }
  }

  Future<ApiResponse<http.Response>> auth(String jwt) async {
    var url = Uri.parse('$baseUrl$kBackendUserTestAuth');
    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwt',
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        // Handle the timeout here
        throw TimeoutException('The connection has timed out!');
      });

      int statusCode = response.statusCode;
      bool success = response.statusCode >= 200 && response.statusCode < 300;
      var data =
          User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      return ApiResponse(
          data: data,
          success: success,
          errorMessage: success ? '' : 'Login failed',
          statusCode: statusCode);
    } on TimeoutException {
      return ApiResponse(
          data: null,
          success: false,
          errorMessage: 'The connection has timed out!',
          statusCode: 408);
    }
  }

  Future<ApiResponse<http.Response>> register(
      String email, String password, String firstName, String lastName) async {
    var url = Uri.parse('$baseUrl$kBackendUserRegister');
    try {
      var response = await http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName
        }),
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        // Handle the timeout here
        throw TimeoutException('The connection has timed out!');
      });

      int statusCode = response.statusCode;
      bool success = response.statusCode >= 200 && response.statusCode < 300;
      User? data;

      if (success) {
        data = User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        data = null;
      }

      return ApiResponse(
          data: data,
          success: success,
          errorMessage: success ? '' : 'Register failed',
          statusCode: statusCode);
    } catch (e) {
      return ApiResponse(
          data: null,
          success: false,
          errorMessage: 'The connection has timed out!',
          statusCode: 408);
    }
  }
}
