import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thread_clone/utils/colors.dart' as colors;
import 'package:thread_clone/view/screens/home.dart';
import 'package:thread_clone/view/screens/login.dart';
import 'package:thread_clone/view/screens/overview.dart';
import 'package:thread_clone/view/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: colors.Colors.blackColor),
      debugShowCheckedModeBanner: false,
      home: OverView(),
      getPages: [
        GetPage(name: "/signup", page: () => SignUp()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/home", page: () => Home()),
      ],
    );
  }
}
