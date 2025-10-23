import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_bar_main.dart';
import 'package:food_app/features/data/foods.dart';
import 'package:food_app/widgets/categories/category_header.dart';
import 'package:food_app/widgets/general/food_card.dart';
import 'package:food_app/widgets/general/restaurant_card_detail.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(title: 'Sobre o restaurante').build(context),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            RestaurantCardDetail(
              deliveryLabel: 'Frete',
              rating: 4.9,
              name: 'Massas e CIA',
              timeLabel: '5 min',
              imagePath: 'assets/images/restaurante/restaurante-1.jpg',
              detailedDescription:
                  'Somos um espaço especializado em massas. Visite o nosso espaço e venha se maravilhar nessa aventura de massas',
            ),
            const SizedBox(height: 16),
            CategoryHeader(
              title: 'Pratos mais pedidos',
              buttonText: 'Vê todos',
            ),
            SizedBox(height: 10),
            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cards per row (mobile)
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9, // control card height
              ),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return FoodCard(
                  imagePath: food.image,
                  description: food.description,
                  scores: food.scores,
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        '/food',
                        arguments: foods,
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
