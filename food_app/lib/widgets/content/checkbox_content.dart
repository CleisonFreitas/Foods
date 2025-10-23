import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class CheckboxContent extends StatefulWidget {
  final String label;
  const CheckboxContent({super.key, required this.label});

  @override
  State<CheckboxContent> createState() => _CheckboxContentState();
}

class _CheckboxContentState extends State<CheckboxContent> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColors.primary,
          splashRadius: 5,
          side: BorderSide.none,
          fillColor:
              _isChecked
                  ? WidgetStateProperty.all(AppColors.primary)
                  : WidgetStateProperty.all(AppColors.enabledInput),
          visualDensity: VisualDensity.comfortable,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(4),
          ),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.label,
          style: AppTexts.regular16.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
