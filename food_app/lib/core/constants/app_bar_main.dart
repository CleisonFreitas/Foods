import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class AppBarMain {
  final String title;

  AppBarMain({required this.title});

  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTexts.regular16.copyWith(fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.menuButton,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.contextButton,
            size: 18,           
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}

