import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Start Saving',
              style:
                  AppTextStyles.text36.copyWith(color: AppColors.greeLightTwo),
            ),
            Text(
              'Your Money!',
              style:
                  AppTextStyles.text36.copyWith(color: AppColors.greeLightTwo),
            ),
            Expanded(
              child: Image.asset('assets/images/ToDoList.png'),
            ),
            TextFormField(),
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
                    style: AppTextStyles.text14.copyWith(color: AppColors.grey),
                  ),
                  Text(' Log in',
                      style: AppTextStyles.text14
                          .copyWith(color: AppColors.greeLightTwo)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
