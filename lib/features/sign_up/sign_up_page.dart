import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Start Saving',
            style: AppTextStyles.text36.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            'Your Money!',
            style: AppTextStyles.text36.copyWith(color: AppColors.greenTwo),
          ),
          Expanded(
            child: Image.asset('assets/images/ToDoList.png'),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Name',
                  hintText: 'Your name',
                  inputFormatters: [
                    UpperCaseInputTextFormatter(),
                  ],
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Esse campo não pode ser vazio.';
                    }
                    debugPrint(value);
                    return null;
                  },
                ),
                const PasswordFormField(
                  helperText:
                      "A senha deve ter ao menos 8 caracteres, 1 letra maiúscula",
                  helperMaxLine: 3,
                  labelText: 'Choose your Password',
                  hintText: '**********',
                ),
                const PasswordFormField(
                  labelText: 'Confirm your Password',
                  hintText: '**********',
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
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                debugPrint(valid.toString());
                if (valid) {
                  //Salva as informações
                  debugPrint('Informações enviadas ao servidor');
                } else {
                  debugPrint('Ocorreu algum erro...');
                }
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
                        .copyWith(color: AppColors.greenTwo)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
