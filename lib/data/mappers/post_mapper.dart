import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/post.dart';
import '../response/post_response.dart';
import 'base_response_mapper.dart';

final postMapper = Provider.autoDispose<PostMapper>((ref) => PostMapper());

class PostMapper implements BaseResponseMapper<List<PostResponse>, List<Post>> {
  @override
  List<Post> mapFromResponse(List<PostResponse> responses) {
    return responses
        .map(
          (response) => Post(
            userId: response.userId,
            id: response.id,
            title: response.title,
            body: response.body,
          ),
        )
        .toList();
  }
}
