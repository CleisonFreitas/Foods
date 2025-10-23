import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class RestaurantCardDetail extends StatelessWidget {
  final String name;
  final String detailedDescription;
  final double rating;
  final String deliveryLabel;
  final String timeLabel;
  final double breakpoint;
  final String imagePath;
  final VoidCallback? onPress;

  const RestaurantCardDetail({
    super.key,
    required this.name,
    required this.rating,
    required this.deliveryLabel,
    required this.timeLabel,
    this.breakpoint = 450,
    required this.imagePath,
    this.onPress,
    required this.detailedDescription,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = mediaWidth < breakpoint;

    final imageCard = Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: isSmallScreen ? 150 : 187,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withAlpha(1), Colors.transparent],
                ),
              ),
            ),

            // Optional content over image (like a tag or logo)
            // Positioned(
            //   bottom: 8,
            //   left: 8,
            //   child: Text(
            //     'Massas e CIA',
            //     style: AppTexts.regular16.copyWith(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );

    final titleSection = ListTile(
      titleAlignment: ListTileTitleAlignment.bottom,
      contentPadding: EdgeInsets.zero,
      title: Text(
        name,
        style: AppTexts.regular32.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: isSmallScreen ? 22 : 32,
        ),
      ),
      subtitle: Text(
        detailedDescription,
        style: AppTexts.regular16.copyWith(
          color: AppColors.disabledInput,
          fontSize: isSmallScreen ? 16 : 18,
        ),
      ),
    );

    return GestureDetector(
      onTap: onPress,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(right: isSmallScreen ? 8 : 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageCard,
              const SizedBox(height: 10),
              titleSection,
            ],
          ),
        ),
      ),
    );
  }
}
