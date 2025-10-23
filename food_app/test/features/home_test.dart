import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/features/app/home.dart';
import 'package:food_app/widgets/categories/category_header.dart';
import 'package:food_app/widgets/content/content_input.dart';
import 'package:food_app/widgets/general/restaurant_card.dart';

void main() {
  testWidgets('Testando exibição da tela home', (test) async {
    await test.pumpWidget(MaterialApp(home: Home()));

    expect(find.byType(CategoryHeader), findsNWidgets(2));
    expect(find.text('Buscar por categorias'), findsOneWidget);
    expect(find.text('Buscar por restaurantes'), findsOneWidget);

    expect(find.byType(RestaurantCard), findsAtLeast(1));
    expect(find.byType(ContentInput), findsOneWidget);
  });
}
