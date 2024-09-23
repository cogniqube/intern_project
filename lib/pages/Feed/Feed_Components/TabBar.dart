import 'package:flutter/material.dart';
import 'package:intern_project/pages/Feed/Feed_Components/User_List_View.dart';

class TabBarPage extends StatefulWidget {
  final List<String> users;

  TabBarPage({super.key, required this.users});

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48, // Height of the TabBar
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color of the TabBar
            borderRadius: BorderRadius.circular(25), // Circular border for the container
          ),
          margin: EdgeInsets.symmetric(horizontal: 16), // Padding around TabBar
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white, // Text color for selected tab
            unselectedLabelColor: Colors.grey, // Text color for unselected tabs
            indicator: BoxDecoration(
              color: Colors.orange, // Background color for selected tab
              borderRadius: BorderRadius.circular(25), // Rounded indicator for selected tab
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Following'),
              Tab(text: 'Like'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              UserListView(users: widget.users),
              Center(child: Text('Following Posts')),
              Center(child: Text('Liked Posts')),
            ],
          ),
        ),
      ],
    );
  }
}
