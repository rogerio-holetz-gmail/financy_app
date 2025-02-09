import 'package:flutter/material.dart';

import 'package:financy_app/common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final int? helperMaxLine;
  final int? errorMaxLine;

  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
    this.helperMaxLine,
    this.errorMaxLine,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;
  //Icon iconeSenha = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      errorMaxLine: widget.errorMaxLine,
      helperText: widget.helperText,
      helperMaxLine: widget.helperMaxLine,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      sufixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          debugPrint("Pressionou");
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }
}
