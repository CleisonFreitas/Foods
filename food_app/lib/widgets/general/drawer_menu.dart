import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  const DrawerMenu({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      splashColor: Colors.black12,
      focusColor: Colors.black12,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Icon(icon, color: AppColors.primary, size: 22),
            Text(
              title,
              style: AppTexts.regular16.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
