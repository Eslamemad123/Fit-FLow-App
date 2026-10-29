import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'availability_pill.dart';

class WeeklyAvailabilitySelector extends StatelessWidget {
  const WeeklyAvailabilitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.cardBorder,
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: AvailabilityPill(
              text: '2 Days',
              isSelected: false,
            ),
          ),
          Expanded(
            child: AvailabilityPill(
              text: '3 Days',
              isSelected: true,
            ),
          ),
          Expanded(
            child: AvailabilityPill(
              text: '4 Days',
              isSelected: false,
            ),
          ),
          Expanded(
            child: AvailabilityPill(
              text: '5+ Days',
              isSelected: false,
            ),
          ),
        ],
      ),
    );
  }
}
