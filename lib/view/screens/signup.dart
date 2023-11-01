import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_clone/controller/users_controller.dart';
import 'package:thread_clone/utils/colors.dart' as color;
import 'package:thread_clone/utils/utils.dart';
import 'package:thread_clone/view/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final controller = Get.put(UsersController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign Up",
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
                final bool founded = controller.addUser({
                  "user": userController.text,
                  "password": passController.text
                });
                if (!founded) {
                  Get.offAllNamed("/login");
                } else {
                  Get.snackbar("User Found", "This User is Already Found",
                      colorText: color.Colors.redColor,
                      snackPosition: SnackPosition.BOTTOM);
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
                "Sign up",
                style: TextStyle(fontSize: 23),
              ),
            )),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            Get.offAllNamed("/login");
          },
          child: RichText(
              text: TextSpan(text: "", children: [
            TextSpan(
                text: 'Or have account',
                style: TextStyle(color: color.Colors.whiteColor, fontSize: 18)),
            TextSpan(
                text: ' Login',
                style: TextStyle(color: color.Colors.redColor, fontSize: 18)),
          ])),
        )
      ],
    ));
  }
}
