import 'package:flutter/material.dart';
import 'package:food_app/features/app/restaurant_details.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: RestaurantDetails());
  }
}