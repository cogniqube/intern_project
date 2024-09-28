import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';

class PostInteraction extends StatefulWidget {
  final int initialLikeCount;

  const PostInteraction({Key? key, required this.initialLikeCount}) : super(key: key);

  @override
  _PostInteractionState createState() => _PostInteractionState();
}

class _PostInteractionState extends State<PostInteraction> {
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikeCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Column(
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : AppColors.black,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                  likeCount += isLiked ? 1 : -1; // Update like count
                });
              },
            ),
            Text('$likeCount likes'), // Display updated like count
          ],
        ),
        Row(
          children: [
            Icon(Icons.comment, color: AppColors.black)
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(Icons.share_outlined, color: AppColors.black),
          ],
        ),
      ],
    );
  }
}
