class Utils {
  static bool textFieldValidation(String name, String pass) {
    if (name.isEmpty || pass.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool isUserFound(String name, String pass, List users) {
    for (var user in users) {
      if (user["user"] == name && user["password"] == pass) {
        return true;
      }
    }
    return false;
  }

  static bool assetImage(String image) {
    if (image.startsWith("assets", 0)) {
      return true;
    } else {
      return false;
    }
  }
}
