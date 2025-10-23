import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_texts.dart';
import 'package:food_app/widgets/auth/resend_code.dart';
import 'package:food_app/widgets/content/content_button.dart';
import 'package:food_app/widgets/content/content_input.dart';

class FormVerification extends StatefulWidget {
  const FormVerification({super.key});

  @override
  State<FormVerification> createState() => _FormVerificationState();
}

class _FormVerificationState extends State<FormVerification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Código', style: AppTexts.regular16),
            ResendCode(),
          ],
        ),
        const SizedBox(height: 20),

        // GridView shrinkWrap inside Column
        SizedBox(
          height: 80,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) {
              return ContentInput(
                controller: TextEditingController(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 1 && index < 3) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
              );
            }),
          ),
        ),

        const SizedBox(height: 20),
        ContentButton(
          title: 'Verificar',
          onPressed: () {
            // Ação de verificação
          },
        ),
      ],
    );
  }
}
