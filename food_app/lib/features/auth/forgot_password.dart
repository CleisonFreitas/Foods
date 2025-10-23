import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_bar_content.dart';
import 'package:food_app/widgets/content/content_button.dart';
import 'package:food_app/widgets/content/content_container.dart';
import 'package:food_app/widgets/content/content_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent.build(context),
      body: SafeArea(
        child: ContentContainer(
          title: 'Recuperar Senha',
          subtitle: 'Insira seu e-mail para recuperar sua senha',
          child: Column(
            children: [
              ContentInput(label: 'E-mail', controller: _emailController),
              const SizedBox(height: 20),
              ContentButton(
                title: 'Enviar',
                onPressed: () {
                  // Ação de recuperação de senha
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
