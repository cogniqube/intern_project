import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';
import '../styles/App_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const MyAppBar(
      {super.key,
      required this.title,
      this.actions,
      required this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppText.header1),
      backgroundColor: AppColors.appbar,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(64);
}
