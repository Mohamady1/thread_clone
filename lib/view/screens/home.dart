import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thread_clone/controller/button_controller.dart';
import 'package:thread_clone/controller/posts-controller.dart';
import 'package:thread_clone/utils/colors.dart' as color;
import 'package:thread_clone/view/widgets/post_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //dependency injection GetX
    final PostsController controller = Get.put(PostsController());
    final ButtonController controllerButton = Get.put(ButtonController());

    //controllers
    final ScrollController _scrollController = ScrollController();
    final TextEditingController _postBodyController = TextEditingController();

    void scrollToTop() {
      _scrollController.animateTo(
        0.0,
        duration: Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }

    _scrollController.addListener(() {
      if (_scrollController.offset > 1000) {
        if (!controllerButton.showScrollToTopButton) {
          controllerButton.toggleButtonVisible();
        }
      } else {
        if (controllerButton.showScrollToTopButton) {
          controllerButton.toggleButtonVisible();
        }
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/animations/palestine.json",
                    width: 70,
                    height: 70,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Image.asset(
                        "assets/images/icon.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.offAllNamed("/login");
                      },
                      icon: Icon(
                        Icons.logout,
                        color: color.Colors.whiteColor,
                      ))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 5,
                  ),
                  child: FutureBuilder(
                    future: controller.fetchAllPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: color.Colors.whiteColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error Occured",
                            style: TextStyle(color: color.Colors.whiteColor),
                          ),
                        );
                      } else if (snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return PostItem(
                                postModel: snapshot.data![index], index: index);
                          },
                          itemCount: snapshot.data!.length,
                        );
                      } else {
                        return Center(
                          child: Text(
                            "Data is Empty",
                            style: TextStyle(color: color.Colors.whiteColor),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<ButtonController>(
            builder: (controller) => controller.showScrollToTopButton
                ? Positioned(
                    bottom: 10,
                    left: 10,
                    child: IconButton(
                        onPressed: scrollToTop,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: color.Colors.redColor,
                          size: 40,
                        )))
                : SizedBox(),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Post Body",
                titleStyle: TextStyle(color: color.Colors.blackColor),
                content: TextField(
                    decoration: InputDecoration(hintText: "Add Post"),
                    controller: _postBodyController),
                textCancel: "Cancel",
                textConfirm: "Post",
                onConfirm: () async {
                  Get.back();
                  if (_postBodyController.text.isEmpty) {
                    Get.snackbar("Empty", "Fill All Fields",
                        backgroundColor: color.Colors.whiteColor);
                  } else {
                    await controller
                        .addPost(_postBodyController.text)
                        .then((value) {
                      Get.snackbar("Post Added By ${value["user"]}",
                          "Post Body: ${value["body"]}",
                          backgroundColor: color.Colors.whiteColor);
                    }).catchError((e) {
                      Get.snackbar(e.toString(), "Post didn't add",
                          backgroundColor: color.Colors.whiteColor);
                    });
                  }
                });
          },
          backgroundColor: color.Colors.redColor,
          child: Icon(Icons.add_comment),
        ),
      ),
    );
  }
}
