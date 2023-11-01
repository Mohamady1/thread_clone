import 'package:get/get.dart';

class UsersController extends GetxController {
  List users = [
    {"user": "admin", "password": "1234"}
  ];

  bool addUser(Map newUser) {
    for (var user in users) {
      if (user["user"] == newUser["user"]) {
        return true;
      }
    }

    users.add(newUser);
    update();
    return false;
  }
}
