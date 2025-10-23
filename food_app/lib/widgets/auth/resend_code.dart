import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';
import 'package:food_app/features/auth/controllers/resend_code_controller.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  final _resendCodeController = ResendCodeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _resendCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _resendCodeController,
      builder: (context, state) {
        final isResendEnabled = _resendCodeController.isResendEnabled;
        final secondsRemaining = _resendCodeController.secondsRemaining;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap:
                  isResendEnabled ? _resendCodeController.restartTimer : null,
              child: Text(
                'Reenviar',
                style: AppTexts.regular16.copyWith(
                  color:
                      isResendEnabled
                          ? AppColors.primary
                          : AppColors.disabledInput,
                ),
              ),
            ),
            if (!isResendEnabled)
              Text(
                ' em... ${secondsRemaining}s',
                style: AppTexts.regular16.copyWith(
                  color: AppColors.disabledInput,
                ),
              ),
          ],
        );
      },
    );
  }
}
