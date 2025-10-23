import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';

class AppBarContent {
  AppBarContent._();

  static AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: true,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.enabledInput,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black38),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}

