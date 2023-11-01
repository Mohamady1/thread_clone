import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentsApi {
  Future<List> fetchPostComments(int postId) async {
    try {
      final http.Response response = await http
          .get(Uri.parse("https://dummyjson.com/posts/$postId/comments"));
      return jsonDecode(response.body)["comments"] as List;
    } catch (e) {
      rethrow;
    }
  }
}
