import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingFooterText extends StatelessWidget {
  const OnboardingFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'YOU CAN CHANGE THIS LATER IN PROFILE',
        style: AppTextStyles.font10SemiBoldLightGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}
