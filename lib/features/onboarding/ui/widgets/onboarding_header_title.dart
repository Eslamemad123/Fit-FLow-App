import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class OnboardingHeaderTitle extends StatelessWidget {
  const OnboardingHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'FitFlow',
      style: AppTextStyles.font20BoldPrimary,
    );
  }
}
