import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_env_flavor/data/datasources/post_remote_data_source_impl.dart';

import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';
import '../mappers/post_mapper.dart';

final postRepositoryImpl = Provider.autoDispose<PostRepositoryImpl>(
  (ref) => PostRepositoryImpl(
    remoteDataSource: ref.watch(postRemoteDataSourceImpl),
    postMapper: ref.watch(postMapper),
  ),
);

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostMapper postMapper;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.postMapper,
  });

  @override
  Future<List<Post>> fetchPosts() async {
    final responses = await remoteDataSource.fetchPosts();
    return postMapper.mapFromResponse(responses);
  }
}
