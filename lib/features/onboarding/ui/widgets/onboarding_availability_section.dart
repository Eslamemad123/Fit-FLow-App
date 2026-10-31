import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/onboarding_input_model.dart';
import 'weekly_availability_selector.dart';

class OnboardingAvailabilitySection extends StatelessWidget {
  static const List<int> _availabilityDaysMap = [2, 3, 4, 5];

  final OnboardingInputModel inputModel;
  final ValueChanged<int>? onAvailabilityDaysChanged;

  const OnboardingAvailabilitySection({
    super.key,
    required this.inputModel,
    this.onAvailabilityDaysChanged,
  });

  int get _selectedIndex {
    final index = _availabilityDaysMap.indexOf(inputModel.availabilityDays);
    return index != -1 ? index : 1;
  }

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
          selectedIndex: _selectedIndex,
          onChanged: (index) {
            final days = _availabilityDaysMap[index];
            inputModel.updateAvailabilityDays(days);
            onAvailabilityDaysChanged?.call(days);
          },
        ),
      ],
    );
  }
}

