import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_env_flavor/data/datasources/post_remote_data_source.dart';
import 'package:flutter_env_flavor/data/response/post_response.dart';

import '../../core/network/api_service.dart';

final postRemoteDataSourceImpl = Provider.autoDispose<PostRemoteDataSourceImpl>(
  (ref) => PostRemoteDataSourceImpl(apiService: ref.watch(apiService)),
);

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiService apiService;

  PostRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<PostResponse>> fetchPosts() async {
    final data = await apiService.getPosts();
    return data
        .map((e) => PostResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
