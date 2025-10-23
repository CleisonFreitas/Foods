import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_texts.dart';
import 'package:food_app/screens/forgot_password_screen.dart';
import 'package:food_app/screens/signup_screen.dart';
import 'package:food_app/widgets/auth/forget_remember.dart';
import 'package:food_app/widgets/content/content_button.dart';
import 'package:food_app/widgets/content/content_input.dart';
import 'package:food_app/widgets/text_button/simple_text_button.dart';
import 'package:go_router/go_router.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ContentInput(label: 'EMAIL', controller: _emailController),
          const SizedBox(height: 20),
          ContentInput(
            label: 'SENHA',
            controller: _passwordController,
            isSecret: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite sua senha';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ForgetRemember(
            onForgotPassword: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              );
            },
            onRememberChanged: () {
              // Handle remember me action
            },
          ),
          const SizedBox(height: 20),
          ContentButton(
            title: 'Log In',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.go('/home');
              }
            },
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Ainda não possui uma conta?",
                style: AppTexts.regular16,
              ),
              SimpleTextButton(
                title: 'Cadastre-se',
                onPressed:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
