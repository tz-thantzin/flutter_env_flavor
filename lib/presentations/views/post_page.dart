import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_env_flavor/core/state.dart';

import '../viewmodels/post_view_model.dart';
import '../widgets/post_card.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsState = ref.watch(postViewModel);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: postsState.when(
          initial: () => const Center(child: Text('No posts yet')),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (posts) => RefreshIndicator(
            onRefresh: () async => ref.read(postViewModel.notifier).getPosts(),
            child: ListView.builder(
              itemCount: posts?.length ?? 0,
              itemBuilder: (context, index) => PostCard(post: posts![index]),
            ),
          ),
          error: (error) => Center(child: Text('Error: ${error.toString()}')),
        ),
      ),
    );
  }
}
