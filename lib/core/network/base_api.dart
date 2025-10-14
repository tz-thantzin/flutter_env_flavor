import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../exceptions/app_exception.dart';
import '../exceptions/base_exception.dart';
import '../exceptions/network_exception.dart';
import '../utils/network_util.dart';

/// Base class for all API calls using [http].
abstract class BaseAPI {
  final http.Client client = http.Client();

  /// Safely executes an API call with network check, error handling and JSON parsing.
  Future<T> request<T>({
    required Future<http.Response> Function() call,
    required T Function(dynamic json) parser,
  }) async {
    // 1. Check connectivity
    if (!await NetworkUtil.isNetworkAvailable()) {
      throw NetworkException("No Internet Connection");
    }

    try {
      // 2. Perform request
      final response = await call();

      // 3. Handle success
      if (response.statusCode == HttpStatus.ok) {
        final dynamic decoded = response.body.isNotEmpty
            ? jsonDecode(response.body)
            : null;
        return parser(decoded);
      }

      // 4. Handle server errors
      throw AppException(
        message: "Request failed [${response.statusCode}]",
        code: response.statusCode,
        details: response.body,
      );
    } catch (error, stack) {
      if (kDebugMode) {
        log("API Request Error", error: error, stackTrace: stack);
      }

      if (error is BaseException) rethrow;

      throw AppException(message: error.toString());
    }
  }

  /// Dispose of the underlying HTTP client.
  void dispose() {
    client.close();
  }
}
