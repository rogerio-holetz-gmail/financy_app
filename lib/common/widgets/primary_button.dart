import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback?
      onPressed; //final void Function()? onTap; seria a mesma coisa
  final String textButton;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.textButton,
  });

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24));

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: onPressed != null
              ? AppColors.greenGradient
              : AppColors.greyGradient,
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Align(
          child: Text(
            textButton,
            style: AppTextStyles.text18.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
