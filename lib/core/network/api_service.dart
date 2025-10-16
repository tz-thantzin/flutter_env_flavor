import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_api.dart';

final apiService = Provider.autoDispose<ApiService>((ref) => ApiService());

class ApiService extends BaseAPI {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> getPosts() {
    return request(
      call: () => client.get(
        Uri.parse("$baseUrl/posts"),
        headers: {"Accept": "application/json"},
      ),
      parser: (json) => json as List<dynamic>,
    );
  }

  Future<Map<String, dynamic>> getPostById(int id) {
    return request(
      call: () => client.get(Uri.parse("$baseUrl/posts/$id")),
      parser: (json) => json as Map<String, dynamic>,
    );
  }

  Future<Map<String, dynamic>> createPost(Map<String, dynamic> body) {
    return request(
      call: () => client.post(
        Uri.parse("$baseUrl/posts"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      ),
      parser: (json) => json as Map<String, dynamic>,
    );
  }
}
