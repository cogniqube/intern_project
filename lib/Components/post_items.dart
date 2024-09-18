import 'package:flutter/material.dart';
import '../styles/App_text.dart';

class PostItems extends StatelessWidget {
  final String user;
  const PostItems({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Image.asset(
                'assets/temp/Profile pic.jpg',
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                user,
                style: AppText.subtitle2,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Image.asset('assets/temp/news.png'),
          SizedBox(
            height: 12,
          ),
          Text(
            '''  "WE'RE LIVE!"
      We are thrilled to announce the launch of our brand new website! www.cogniqube.com
      Explore the future of AI innovation with Cogni Qube!''',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
