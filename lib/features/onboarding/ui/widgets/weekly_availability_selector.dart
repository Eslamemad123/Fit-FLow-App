import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'availability_pill.dart';

class WeeklyAvailabilitySelector extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const WeeklyAvailabilitySelector({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

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
      child: Row(
        children: [
          for (int i = 0; i < options.length; i++)
            Expanded(
              child: AvailabilityPill(
                text: options[i],
                isSelected: selectedIndex == i,
                onTap: () => onChanged(i),
              ),
            ),
        ],
      ),
    );
  }
}
