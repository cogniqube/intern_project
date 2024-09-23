import 'package:flutter/material.dart';
import 'package:intern_project/Components/App%20Bar.dart';
import 'package:intern_project/pages/Feed/Feed_Components/post_items.dart';
import 'package:intern_project/pages/Feed/Feed_Components/User_List_View.dart';
import 'package:intern_project/pages/Feed/Feed_Components/TabBar.dart';
import 'package:intern_project/styles/App_text.dart';
import 'package:intern_project/styles/app_colors.dart';
import 'package:intern_project/pages/main_page.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: IconButton(
          icon: Icon(Icons.search_outlined),
          onPressed: () {
            print('Search');
          },
        ),
        title: 'Feed',
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notification actions here
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Handle shopping cart actions here
            },
          ),
        ], automaticallyImplyLeading: false,
      ),
      body:
          Column(
            children: [
              Flexible(flex:1,child: TabBarPage(users: [],)),
            ],
          ),
    );
  }
}
