import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.isArabic ? 'ar' : 'en';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLocale,
          isDense: true,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: AppColors.white,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textGrey,
            size: 18,
          ),
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(LocaleKeys.language_en.tr()),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(LocaleKeys.language_ar.tr()),
            ),
          ],
          onChanged: (value) {
            if (value != null && value != currentLocale) {
              context.setLocale(Locale(value));
            }
          },
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
