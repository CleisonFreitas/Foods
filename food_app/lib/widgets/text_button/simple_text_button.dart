import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class SimpleTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const SimpleTextButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary,
      overlayColor: WidgetStatePropertyAll(Colors.white),
      onTap: onPressed,
      child: Text(
        title,
        style: AppTexts.regular16.copyWith(
          color: AppColors.primary,
          backgroundColor: Colors.white,
          decorationColor: Colors.white,
        ),
      ),
    );
  }
}
