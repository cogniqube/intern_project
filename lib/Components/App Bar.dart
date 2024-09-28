import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';
import '../styles/App_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const MyAppBar(
      {super.key,
      required this.title,
//       this.actions,
// <<<<<<< HEAD
//       required this.automaticallyImplyLeading, required IconButton leading});
// =======
//       required this.automaticallyImplyLeading, required this.leading});
// >>>>>>> 600b800260655c6593a2b9e325359cdbda09277c

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(title, style: AppText.appBar.copyWith(color: AppColors.black)),
      foregroundColor: AppColors.black,
      actions: actions,
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(44);
}
