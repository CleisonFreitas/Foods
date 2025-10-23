import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_bar_content.dart';
import 'package:food_app/features/auth/form_register.dart';
import 'package:food_app/widgets/content/content_container.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent.build(context),
      body: ContentContainer(
        title: 'Registrar',
        subtitle: 'Registre-se para continuar',
        child: FormRegister(),
      ),
    );
  }
}
