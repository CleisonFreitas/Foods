import 'package:flutter/material.dart';
import 'package:food_app/widgets/general/drawer_menu.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 7,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Wrap(
                direction: Axis.vertical,
                children: [
                  DrawerMenu(
                    onTap: () {},
                    title: 'Carrinho de compras',
                    icon: Icons.shopping_cart,
                  ),
                  DrawerMenu(
                    onTap: () {},
                    title: 'Preferências',
                    icon: Icons.settings,
                  ),
                ],
              ),

              DrawerMenu(
                onTap: () {},
                title: 'Realizar Logout',
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      );
  }
}