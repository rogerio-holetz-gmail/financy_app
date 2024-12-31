import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/images/man.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Spend Smarter',
                    style: AppTextStyles.text36.copyWith(
                      color: AppColors.greeLightTwo,
                    ),
                  ),
                  Text(
                    'Save More',
                    style: AppTextStyles.text36.copyWith(
                      color: AppColors.greeLightTwo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: PrimaryButton(
                      textButton: 'Get Started',
                      onPressed: () {
                        debugPrint('Teste');
                      },
                    ),
                  ),
                  Text('Already Have Account? log in',
                      style:
                          AppTextStyles.text14.copyWith(color: AppColors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}