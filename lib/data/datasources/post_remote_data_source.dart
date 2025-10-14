import 'package:flutter_env_flavor/data/response/post_response.dart';

abstract class PostRemoteDataSource {
  Future<List<PostResponse>> fetchPosts();
}
