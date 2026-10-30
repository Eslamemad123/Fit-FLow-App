import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingFooterText extends StatelessWidget {
  const OnboardingFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.change_later_in_profile.tr(),
        style: AppTextStyles.font10SemiBoldLightGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}
