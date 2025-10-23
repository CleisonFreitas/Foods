import 'package:flutter/material.dart';
import 'package:food_app/features/auth/form_login.dart';
import 'package:food_app/widgets/content/content_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        title: 'Log In',
        subtitle: 'Please sign in to continue',
        child: FormLogin()
      ),
    );
  }
}
