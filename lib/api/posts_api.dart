import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thread_clone/api/user_api.dart';

class PostsApi {
  Future<List> fetchAllPosts() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("https://dummyjson.com/posts"));
      final posts = jsonDecode(response.body)["posts"] as List;

      final userIds = posts.map((post) => post["userId"]).toSet();

      final List users = await UsersApi().fetchUsers(userIds);

      final List combinedData = posts.map((post) {
        final userId = post["userId"];
        final user = users.firstWhere((user) => user["id"] == userId);
        post["user"] = user;
        return post;
      }).toList();

      return combinedData;
    } catch (e) {
      rethrow;
    }
  }

  Future addPost(String postBody) async {
    try {
      final http.Response response = await http
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
        "user": "User",
        "body": postBody,
        "reactions": "0",
        "image": "assets/images/me.jpg"
      });
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
