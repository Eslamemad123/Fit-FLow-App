import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingTitleSection extends StatelessWidget {
  const OnboardingTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Goal',
          style: AppTextStyles.font26BoldDark,
        ),
        const SizedBox(height: 8),
        Text(
          'Customize your journey for precision performance.',
          style: AppTextStyles.font14RegularGrey,
        ),
      ],
    );
  }
}
