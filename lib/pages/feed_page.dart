import 'package:flutter/material.dart';
import 'package:intern_project/Components/App%20Bar.dart';
import 'package:intern_project/Components/post_items.dart';
import 'package:intern_project/styles/App_text.dart';
import 'package:intern_project/styles/app_colors.dart';
import 'package:intern_project/pages/main_page.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: MyAppBar(
        title: 'Home Page',
        actions: [
        ], automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItems(
            user: users[index],
          );
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 24);
        },
      ),
    );
  }

  mockUsersFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('User Number $i');
    }
  }
}
