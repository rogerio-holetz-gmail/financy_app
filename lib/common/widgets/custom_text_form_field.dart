import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final int? maxLenght;
  final TextInputAction? textInputAction;
  final Widget? sufixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  //final String? Function(String?)? validator;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyBoardType,
    this.maxLenght,
    this.textInputAction,
    this.sufixIcon,
    this.obscureText,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenTwo,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
      child: TextFormField(
        validator: widget.validator,
        style: AppTextStyles.inputText.copyWith(color: AppColors.greenOne),
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLenght,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.sufixIcon,
          hintText: widget.hintText,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.text14.copyWith(color: AppColors.grey),
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
