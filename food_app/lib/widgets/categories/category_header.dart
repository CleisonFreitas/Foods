import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_texts.dart';
import 'package:food_app/widgets/text_button/simple_text_button.dart';

class CategoryHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final double breakpoint;

  const CategoryHeader({
    super.key,
    required this.title,
    required this.buttonText,
    this.onButtonPressed,
    this.breakpoint = 370,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final isMobile = mediaWidth < breakpoint;

    final titleText = Text(
      title,
      style: AppTexts.regular16.copyWith(fontWeight: FontWeight.w600),
    );

    final button = SimpleTextButton(
      title: buttonText,
      onPressed: onButtonPressed,
    );

    return isMobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [titleText, button],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [titleText, button],
        );
  }
}
