import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_clone/controller/users_controller.dart';
import 'package:thread_clone/utils/colors.dart' as color;
import 'package:thread_clone/utils/utils.dart';
import 'package:thread_clone/view/widgets/text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final UsersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset("assets/images/accessories .png")),
            SizedBox(
              height: 70,
            ),
            Text(
              "Log In",
              style: TextStyle(
                  color: color.Colors.whiteColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            CustomTextField(
              hintText: "Name",
              controller: userController,
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: passController,
              hintText: "Password",
            ),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: color.Colors.whiteColor))),
                onPressed: () {
                  final bool pass = Utils.textFieldValidation(
                      userController.text, passController.text);
                  if (pass) {
                    final bool founded = Utils.isUserFound(userController.text,
                        passController.text, controller.users);
                    if (founded) {
                      Get.offAllNamed("/home");
                    } else {
                      Get.defaultDialog(
                          backgroundColor: color.Colors.dialogeColor,
                          title: "User Not Found",
                          titleStyle: TextStyle(
                              color: color.Colors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          middleText: "",
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                  userController.clear();
                                  passController.clear();
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: color.Colors.redColor,
                                ),
                                child: Text(
                                  "Try again",
                                  style: TextStyle(
                                      color: color.Colors.whiteColor,
                                      fontSize: 17),
                                )),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed("/signup");
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: color.Colors.redColor)),
                                    backgroundColor: Colors.transparent),
                                child: Text(
                                  "Create an account",
                                  style: TextStyle(
                                      color: color.Colors.redColor,
                                      fontSize: 17),
                                )),
                          ]);
                    }
                  } else {
                    Get.snackbar("Warning", "",
                        maxWidth: 220,
                        icon: Icon(
                          Icons.warning,
                          color: color.Colors.yellowColor,
                          size: 20,
                        ),
                        messageText: Text(
                          "Fill All Fields",
                          style: TextStyle(
                              fontSize: 15, color: color.Colors.whiteColor),
                        ),
                        backgroundColor: color.Colors.redColor,
                        colorText: color.Colors.whiteColor);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 23),
                  ),
                )),
          ],
        ));
  }
}
