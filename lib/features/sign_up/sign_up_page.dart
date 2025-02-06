import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _controller = SignUpController();

  @override
  void dispose() {
    _passwordController.dispose();
    //_controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CustomCircularProgressIndicator()));
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Oi'),
              ),
            ),
          ),
        );
      }
      if (_controller.state is SignUpErrorState) {
        Navigator.pop(context);
        customModalBottomSheet(context);
      }
    });
  }

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
                  errorMaxLine: 3,
                  helperMaxLine: 3,
                  labelText: 'Name',
                  hintText: 'Your name',
                  inputFormatters: [
                    UpperCaseInputTextFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
                PasswordFormField(
                  errorMaxLine: 3,
                  controller: _passwordController,
                  helperText:
                      "A senha deve ter ao menos 8 caracteres, 1 letra maiúscula",
                  helperMaxLine: 3,
                  labelText: 'Choose your Password',
                  hintText: '**********',
                ),
                PasswordFormField(
                  errorMaxLine: 3,
                  helperMaxLine: 3,
                  validator: (value) => Validator.validateConfirmPassword(
                      value, _passwordController.text),
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
                //debugPrint(valid.toString());
                if (valid) {
                  //developer.log(SignUpState.state.toString());
                  _controller.doSignUp();
                } else {
                  developer.log('Ocorreu algum erro...');
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
