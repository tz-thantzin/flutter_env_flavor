import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_env_flavor/domain/entities/post.dart';

import '../../core/exceptions/base_exception.dart';
import '../../core/exceptions/generic_exception.dart';
import '../../core/state.dart';
import '../../domain/usecases/post_use_case.dart';
import '../../domain/usecases/post_use_case_impl.dart';

final postViewModel =
    NotifierProvider.autoDispose<PostViewModel, State<List<Post>>>(
      PostViewModel.new,
    );

class PostViewModel extends Notifier<State<List<Post>>> {
  late final PostsUseCase _postUseCase;

  @override
  State<List<Post>> build() {
    _postUseCase = ref.read(postUseCaseImpl);
    getPosts();
    return const State.initial();
  }

  Future<void> getPosts() async {
    try {
      state = const State.loading();
      final posts = await _postUseCase.fetchPosts();
      state = State.success(posts);
    } on BaseException catch (e) {
      state = State.error(e);
    } catch (e) {
      state = State.error(GenericException(message: e.toString()));
    }
  }
}
