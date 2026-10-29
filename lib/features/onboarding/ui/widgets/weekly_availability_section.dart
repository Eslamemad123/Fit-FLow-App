import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'weekly_availability_selector.dart';

class WeeklyAvailabilitySection extends StatelessWidget {
  const WeeklyAvailabilitySection({super.key});

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
        const WeeklyAvailabilitySelector(),
      ],
    );
  }
}
