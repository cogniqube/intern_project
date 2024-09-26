import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';
import '../../../styles/App_text.dart';
import '../feed_styles/Post_Intractions.dart';

class PostItems extends StatelessWidget {
  final String user;
  const PostItems({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Row
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/feed_profile_icon.jpeg'),
                  radius: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    user,
                    style: AppText.subtitle2.copyWith(color: AppColors.black)
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: AppColors.followButton,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            // Main Image
            ClipRRect(
              child: Image.asset(
                'assets/images/feed_post_image.jpeg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 12),

            // Post Info Row (likes, comments, shares)
            PostInteraction(initialLikeCount: 150),

            SizedBox(height: 8),

            // Post Description
            Text(
              '''Wow, there are so many people. I wanted to finish the race but I gave up. I felt at ease when I gave up.''',
              style: AppText.subtitle3,
            ),

            SizedBox(height: 8),

            // Comment Box
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your comments',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Post comment action
                  },
                  child: Text('Post'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
