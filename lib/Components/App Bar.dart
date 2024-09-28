import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';
import '../styles/app_text.dart'; // Updated to lowercase for consistency

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const MyAppBar({
    Key? key,
    required this.title,
    required this.leading,
    this.actions,
    this.automaticallyImplyLeading = true, // Default value added for flexibility
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: AppText.appBar.copyWith(color: AppColors.black),
      ),
      foregroundColor: AppColors.black,
      actions: actions,
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44); // Height of the AppBar
}
