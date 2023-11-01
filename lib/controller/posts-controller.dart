import 'package:get/get.dart';
import 'package:thread_clone/api/posts_api.dart';
import 'package:thread_clone/model/post_model.dart';

class PostsController extends GetxController {
  List<PostModel> posts = [];

  Future<List<PostModel>> fetchAllPosts() async {
    try {
      await PostsApi().fetchAllPosts().then((value) =>
          posts.addAll(value.map((e) => PostModel.fromJson(e)).toList()));
      return posts;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> addPost(String postBody) async {
    Map<String, dynamic> response = {};
    try {
      await PostsApi().addPost(postBody).then((value) {
        posts.insert(0, PostModel.fromFakePostJson(value));
        response = value;
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void toggleLove(int postIndex) {
    posts[postIndex].love = !posts[postIndex].love;
    update();
  }
}
