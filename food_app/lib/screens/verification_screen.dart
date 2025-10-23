import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_bar_content.dart';
import 'package:food_app/features/auth/form_verification.dart';
import 'package:food_app/widgets/content/content_container.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent.build(context),
      body: ContentContainer(
        title: 'Verificação',
        subtitle: 'Nós enviamos um código de verificação para o seu email.',
        child: const FormVerification(),
      ),
    );
  }
}
