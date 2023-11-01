import 'package:flutter/material.dart';
import 'package:thread_clone/utils/colors.dart' as color;

import 'package:thread_clone/model/comment_model.dart';

class CommentItem extends StatelessWidget {
  final CommentModel commentItem;
  const CommentItem({required this.commentItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              commentItem.user!,
              style: TextStyle(
                  color: color.Colors.whiteColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.reply,
              color: color.Colors.whiteColor,
            )
          ],
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              commentItem.body!,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Divider(
          color: color.Colors.dialogeColor,
          indent: 30,
          endIndent: 30,
          thickness: 2,
        )
      ],
    );
  }
}
