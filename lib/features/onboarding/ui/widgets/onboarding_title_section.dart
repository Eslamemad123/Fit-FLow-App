import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingTitleSection extends StatelessWidget {
  const OnboardingTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.select_your_goal.tr(),
          style: AppTextStyles.font26BoldDark,
        ),
        const SizedBox(height: 8),
        Text(
          LocaleKeys.select_your_goal_subtitle.tr(),
          style: AppTextStyles.font14RegularGrey,
        ),
      ],
    );
  }
}
