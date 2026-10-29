import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/goal_option_model.dart';
import 'goal_radio_indicator.dart';

class GoalCard extends StatelessWidget {
  final GoalOptionModel goal;
  final bool isSelected;

  const GoalCard({
    super.key,
    required this.goal,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.cardBorder,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.lightBlueBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(goal.icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(goal.title, style: AppTextStyles.font16BoldDark),
                const SizedBox(height: 2),
                Text(goal.description, style: AppTextStyles.font13RegularGrey),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GoalRadioIndicator(isSelected: isSelected),
        ],
      ),
    );
  }
}
