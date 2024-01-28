import 'package:flutter/foundation.dart';

const kDevelopmentString = "https://10.0.2.2:7271";
const kProductionString = "";

const kBackendUserLogin = "/api/User/login/";
const kBackendUserRegister = "/api/User/register";
const kBackendUserTestJwt = "/api/User/test/jwt";
const kBackendUserTestAuth = "api/User/test/auth";

class BackendEndpoints {
  String getBaseUrl() {
    if (kDebugMode) {
      return kDevelopmentString;
    } else {
      return kDevelopmentString;
    }
  }
}

class ApiResponse<T> {
  final dynamic data;
  final bool success;
  final String errorMessage;
  final int statusCode;

  ApiResponse({
    required this.data,
    required this.success,
    required this.statusCode,
    this.errorMessage = '',
  });
}
