import 'package:flutter/material.dart';
import 'package:intern_project/pages/Feed/Feed_Components/post_items.dart';

class UserListView extends StatelessWidget {
  List<String> users = [];

  UserListView({super.key, required this.users});
  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return ListView.separated(
      itemBuilder: (context, index) {
        return PostItems(
          user: users[index],
        );
      },
      itemCount: users.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 24);
      },
    );
  }
  mockUsersFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('User Number $i');
    }
  }
}
