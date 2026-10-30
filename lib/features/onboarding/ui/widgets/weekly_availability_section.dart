import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'weekly_availability_selector.dart';

class WeeklyAvailabilitySection extends StatefulWidget {
  final ValueChanged<String>? onAvailabilityChanged;

  const WeeklyAvailabilitySection({
    super.key,
    this.onAvailabilityChanged,
  });

  @override
  State<WeeklyAvailabilitySection> createState() => _WeeklyAvailabilitySectionState();
}

class _WeeklyAvailabilitySectionState extends State<WeeklyAvailabilitySection> {
  int _selectedIndex = 1;

  static const List<String> _options = [
    '2 Days',
    '3 Days',
    '4 Days',
    '5+ Days',
  ];

  void _onPillTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onAvailabilityChanged?.call(_options[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekly Availability',
          style: AppTextStyles.font16BoldDark,
        ),
        const SizedBox(height: 12),
        WeeklyAvailabilitySelector(
          options: _options,
          selectedIndex: _selectedIndex,
          onChanged: _onPillTapped,
        ),
      ],
    );
  }
}
