import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'weekly_availability_selector.dart';

class WeeklyAvailabilitySection extends StatefulWidget {
  final ValueChanged<int>? onAvailabilityIndexChanged;

  const WeeklyAvailabilitySection({
    super.key,
    this.onAvailabilityIndexChanged,
  });

  @override
  State<WeeklyAvailabilitySection> createState() => _WeeklyAvailabilitySectionState();
}

class _WeeklyAvailabilitySectionState extends State<WeeklyAvailabilitySection> {
  int _selectedIndex = 1;

  List<String> _getOptions() => [
    LocaleKeys.days_2.tr(),
    LocaleKeys.days_3.tr(),
    LocaleKeys.days_4.tr(),
    LocaleKeys.days_5_plus.tr(),
  ];

  void _onPillTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onAvailabilityIndexChanged?.call(index);
  }

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
          onChanged: _onPillTapped,
        ),
      ],
    );
  }
}
