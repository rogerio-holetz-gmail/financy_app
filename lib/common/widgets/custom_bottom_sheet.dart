import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

Future<dynamic> customModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    //sheetAnimationStyle: _animationStyle,
    builder: (BuildContext context) {
      //return SizedBox.expand(
      return Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Ocorreu um erro',
                style: AppTextStyles.text20.copyWith(color: AppColors.darkGrey),
              ),
              ElevatedButton(
                child: const Text('Fechar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
