import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'FitFlow',
      style: AppTextStyles.font36Bold,
      textAlign: TextAlign.center,
    );
  }
}
