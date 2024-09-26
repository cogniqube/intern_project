import 'package:flutter/material.dart';
import 'package:intern_project/styles/app_colors.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap; // Callback for tap event

  const CustomTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the callback on tap
      child: Container(
        width: 82,
        height: 28,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.unselectedButton,
          ),
        ),
      ),
    );
  }
}
