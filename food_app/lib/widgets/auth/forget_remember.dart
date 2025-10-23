import 'package:flutter/material.dart';
import 'package:food_app/widgets/content/checkbox_content.dart';
import 'package:food_app/widgets/text_button/simple_text_button.dart';

class ForgetRemember extends StatelessWidget {
  final VoidCallback? onRememberChanged;
  final VoidCallback? onForgotPassword;

  const ForgetRemember({
    super.key,
    this.onRememberChanged,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final isMobile = mediaWidth < 370;

    final checkbox = CheckboxContent(
      label: 'Lembrar-me',
      //  onChanged: (_) => onRememberChanged?.call(),
    );

    final forgotButton = SimpleTextButton(
      title: 'Esqueci minha senha',
      onPressed: onForgotPassword,
    );

    return isMobile
        ? Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            checkbox,
            forgotButton,
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [checkbox, forgotButton],
        );
  }
}
