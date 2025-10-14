import '../entities/post.dart';

abstract class PostsUseCase {
  Future<List<Post>> fetchPosts();
}
