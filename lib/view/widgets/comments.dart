import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_clone/controller/comments_controller.dart';
import 'package:thread_clone/view/widgets/comment_item.dart';
import 'package:thread_clone/utils/colors.dart' as color;

class Comments extends StatelessWidget {
  final int postId;
  const Comments({required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    final CommentsController controller = Get.put(CommentsController());

    return Container(
      decoration: BoxDecoration(
          color: color.Colors.blackColor,
          border: Border.all(color: color.Colors.redColor),
          borderRadius: BorderRadius.circular(20)),
      height: double.infinity,
      child: Column(
        children: [
          Divider(
            indent: 170,
            endIndent: 170,
            thickness: 2,
            color: color.Colors.whiteColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.fetchPostComments(postId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: color.Colors.whiteColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error Occured"),
                  );
                } else if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: CommentItem(commentItem: snapshot.data![index]),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Comments, Be First",
                      style: TextStyle(color: color.Colors.whiteColor),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
