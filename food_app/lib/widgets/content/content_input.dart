import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/constants/app_texts.dart';

class ContentInput extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final int? maxLength;
  final bool isSecret;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextAlign? textAlign;
  final String? hintText;
  final Widget? prefixIcon;

  const ContentInput({
    super.key,
    this.label,
    required this.controller,
    this.maxLength,
    this.isSecret = false,
    this.validator,
    this.keyboardType,
    this.autofocus = false,
    this.textInputAction,
    this.onChanged,
    this.textAlign,
    this.hintText,
    this.prefixIcon,
  });

  @override
  State<ContentInput> createState() => _ContentInputState();
}

class _ContentInputState extends State<ContentInput> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTexts.regular16.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
        ],
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          maxLength: widget.maxLength,
          obscureText: _obscure,
          autofocus: widget.autofocus,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: AppTexts.inputTextStyle,
          cursorColor: AppColors.disabledInput,
          onChanged: widget.onChanged,
          textAlign: widget.textAlign ?? TextAlign.start,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTexts.regular16.copyWith(color: Colors.black45, fontWeight: FontWeight.w700),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isSecret
                    ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.disabledInput,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                    : null,
            counterText: "", // hides counter when maxLength set
            filled: true,
            fillColor: AppColors.enabledInput,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            border: _inputBorder(AppColors.disabledInput),
            enabledBorder: _inputBorder(AppColors.disabledInput),
            focusedBorder: _inputBorder(AppColors.enabledInput),
            errorBorder: _inputBorder(Colors.red),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _inputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );
}
