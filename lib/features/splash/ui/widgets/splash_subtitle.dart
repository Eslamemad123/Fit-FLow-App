import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashSubtitle extends StatelessWidget {
  const SplashSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'ELEVATE YOUR MOVEMENT',
      style: AppTextStyles.font12SemiBold,
      textAlign: TextAlign.center,
    );
  }
}
