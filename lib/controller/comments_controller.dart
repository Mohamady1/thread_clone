import 'package:get/get.dart';
import 'package:thread_clone/api/comments_api.dart';
import 'package:thread_clone/model/comment_model.dart';

class CommentsController extends GetxController {
  List<CommentModel> postComments = [];

  Future<List<CommentModel>> fetchPostComments(int postId) async {
    await CommentsApi().fetchPostComments(postId).then((value) => postComments
        .addAll(value.map((e) => CommentModel.fromJson(e)).toList()));
    return postComments;
  }
}
