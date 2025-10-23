import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final double scores;
  final VoidCallback? onTap;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.description,
    required this.scores,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do produto
            AspectRatio(
              aspectRatio: 1.4, // mantém proporção quadrada
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      color: AppColors.disabledInput,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.fastfood,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
              ),
            ),
    
            // Informações do produto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTexts.regular16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.contextButton,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.star, color: AppColors.primary, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        scores.toStringAsFixed(1),
                        style: AppTexts.regular16.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
