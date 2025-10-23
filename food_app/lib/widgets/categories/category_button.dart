import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;
  const CategoryButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final spaceWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Card(
            shadowColor: Colors.black45,
            elevation: 7,
            color: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              borderSide: BorderSide.none,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: spaceWidth * 0.35,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primary,
                    radius: 20,
                    child: Icon(icon),
                  ),
                  Flexible(
                    child: Text(
                      name,
                      style: AppTexts.regular16.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
