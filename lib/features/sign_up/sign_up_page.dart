import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Start Saving',
            style: AppTextStyles.text36.copyWith(color: AppColors.greeLightTwo),
          ),
          Text(
            'Your Money!',
            style: AppTextStyles.text36.copyWith(color: AppColors.greeLightTwo),
          ),
          Expanded(
            child: Image.asset('assets/images/ToDoList.png'),
          ),
          const Form(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Name',
                  hintText: 'Your name',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              top: 16,
              bottom: 4,
            ),
            child: PrimaryButton(
              textButton: 'Sign Up',
              onPressed: () {
                debugPrint('Teste');
              },
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Logando...');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Already Have Account?',
                  style:
                      AppTextStyles.text14.copyWith(color: AppColors.darkGrey),
                ),
                Text(' Log in',
                    style: AppTextStyles.text14
                        .copyWith(color: AppColors.greeLightTwo)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final int? maxLenght;
  final TextInputAction? textInputAction;
  const CustomTextFormField(
      {super.key,
      this.padding,
      this.hintText,
      required this.labelText,
      this.textCapitalization,
      this.controller,
      this.keyBoardType,
      this.maxLenght,
      this.textInputAction});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greeLightTwo,
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
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLenght,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText.toUpperCase(),
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
