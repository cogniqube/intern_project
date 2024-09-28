import 'package:flutter/material.dart';
import 'package:intern_project/pages/Feed/Feed_Components/User_List_View.dart';
import 'package:intern_project/styles/app_colors.dart';
import '../feed_styles/Custom_tab.dart';

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

    // Add listener to update state when the tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
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
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.tabBar,
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(),
            labelColor: Colors.transparent, // Hide the default label color
            unselectedLabelColor: Colors.transparent, // Hide the default unselected color
            tabs: [
              CustomTab(
                text: 'All',
                isSelected: _tabController.index == 0,
                onTap: () {
                  setState(() {
                    _tabController.animateTo(0);
                  });
                },
              ),
              CustomTab(
                text: 'Following',
                isSelected: _tabController.index == 1,
                onTap: () {
                  setState(() {
                    _tabController.animateTo(1);
                  });
                },
              ),
              CustomTab(
                text: 'Like',
                isSelected: _tabController.index == 2,
                onTap: () {
                  setState(() {
                    _tabController.animateTo(2);
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
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
