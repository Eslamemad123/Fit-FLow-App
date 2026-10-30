import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashSubtitle extends StatelessWidget {
  const SplashSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.splash_subtitle.tr(),
      style: AppTextStyles.font12SemiBold,
      textAlign: TextAlign.center,
    );
  }
}
