import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thread_clone/utils/colors.dart' as color;

class OverView extends StatelessWidget {
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LottieBuilder.asset("assets/animations/threads.json"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: color.Colors.whiteColor,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Get.offAllNamed("/signup");
                },
                child: Text(
                  "Get Started",
                  style:
                      TextStyle(color: color.Colors.blackColor, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
