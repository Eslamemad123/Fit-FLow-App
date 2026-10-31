import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'weekly_availability_selector.dart';

class WeeklyAvailabilitySection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onAvailabilityIndexChanged;

  const WeeklyAvailabilitySection({
    super.key,
    this.selectedIndex = 1,
    this.onAvailabilityIndexChanged,
  });

  List<String> _getOptions() => [
    LocaleKeys.days_2.tr(),
    LocaleKeys.days_3.tr(),
    LocaleKeys.days_4.tr(),
    LocaleKeys.days_5_plus.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    final options = _getOptions();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.weekly_availability.tr(),
          style: AppTextStyles.font16BoldDark,
        ),
        const SizedBox(height: 12),
        WeeklyAvailabilitySelector(
          options: options,
          selectedIndex: selectedIndex,
          onChanged: (index) => onAvailabilityIndexChanged?.call(index),
        ),
      ],
    );
  }
}
