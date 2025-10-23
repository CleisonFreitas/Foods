import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';
import 'package:food_app/widgets/categories/category_button.dart';
import 'package:food_app/widgets/categories/category_header.dart';
import 'package:food_app/widgets/content/content_input.dart';
import 'package:food_app/widgets/general/drawer_component.dart';
import 'package:food_app/widgets/general/restaurant_card.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cleison Freitas',
          style: AppTexts.regular16.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.primary,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 15),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.contextButton),
              iconColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerComponent(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            ContentInput(
              controller: TextEditingController(),
              hintText: 'Pesquisar comida',
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.disabledInput,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CategoryHeader(
                title: 'Buscar por categorias',
                buttonText: 'Acessar todas',
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 5,
                children: <Widget>[
                  CategoryButton(
                    onTap: () {},
                    name: 'Hot dog',
                    icon: Icons.fastfood,
                  ),
                  CategoryButton(
                    onTap: () {},
                    name: 'Pizza',
                    icon: Icons.local_pizza,
                  ),
                  CategoryButton(
                    onTap: () {},
                    name: 'Hamburguers',
                    icon: Icons.lunch_dining,
                  ),
                  CategoryButton(
                    onTap: () {},
                    name: 'Salads',
                    icon: Icons.ramen_dining,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CategoryHeader(
              title: 'Buscar por restaurantes',
              buttonText: 'Acessar todos',
            ),
            const SizedBox(height: 10),
            RestaurantCard(
              deliveryLabel: 'Frete',
              description: 'Massas - Pizzas - Próximos',
              rating: 4.9,
              name: 'Massas e CIA',
              timeLabel: '5 min',
              imagePath: 'assets/images/restaurante/restaurante-1.jpg',
              onPress: () => context.push('/details'),
            ),
            RestaurantCard(
              deliveryLabel: 'Frete',
              description: 'Massas - Pizzas - Rodízios',
              rating: 4.7,
              name: 'Cosinha Francesa',
              timeLabel: '10 min',
              imagePath: 'assets/images/restaurante/restaurante-2.jpg',
            ),
            RestaurantCard(
              deliveryLabel: 'Frete',
              description: 'Carnes - Rodízios',
              rating: 3.8,
              name: 'Lacarte Carne',
              timeLabel: '20 min',
              imagePath: 'assets/images/restaurante/restaurante-3.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
