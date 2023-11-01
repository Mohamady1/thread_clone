import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:thread_clone/controller/posts-controller.dart';
import 'package:thread_clone/model/post_model.dart';
import 'package:thread_clone/utils/colors.dart' as color;
import 'package:thread_clone/utils/utils.dart';
import 'package:thread_clone/view/widgets/comments.dart';

class PostItem extends StatelessWidget {
  final PostModel postModel;
  final int index;

  PostItem({required this.postModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.assetImage(postModel.image!)
                ? Image.asset(
                    postModel.image!,
                    width: 55,
                    height: 55,
                  )
                : Image.network(
                    postModel.image!,
                    width: 55,
                    height: 55,
                  ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel.user!,
                    style: TextStyle(
                      color: color.Colors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    postModel.body!,
                    style: TextStyle(
                      color: color.Colors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GetBuilder<PostsController>(
                          builder: (controller) => IconButton(
                                onPressed: () {
                                  controller.toggleLove(index);
                                },
                                icon: postModel.love
                                    ? Icon(
                                        Icons.favorite,
                                        color: color.Colors.redColor,
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                        color: color.Colors.whiteColor,
                                      ),
                              )),
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Comments(
                              postId: postModel.id!,
                            ),
                          );
                        },
                        icon: Icon(
                          Ionicons.chatbubble_outline,
                          color: color.Colors.whiteColor,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${postModel.reactions.toString()} reactions",
                        style: TextStyle(
                          color: color.Colors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(
          color: color.Colors.whiteColor,
        )
      ],
    );
  }
}
