import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersApi {
  Future fetchUsers(Set userIds) async {
    try {
      final List userFutures = userIds.map((userId) async {
        final response =
            await http.get(Uri.parse("https://dummyjson.com/user/$userId"));
        return jsonDecode(response.body);
      }).toList();
      return await Future.wait(userFutures as Iterable<Future>);
    } catch (e) {
      rethrow;
    }
  }
}
