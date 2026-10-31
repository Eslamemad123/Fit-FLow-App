import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  bool get isArabic {
    try {
      return locale.languageCode == 'ar';
    } catch (_) {
      return Localizations.maybeLocaleOf(this)?.languageCode == 'ar';
    }
  }
}
