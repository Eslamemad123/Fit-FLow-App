import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../../data/models/goal_option_model.dart';
import 'goal_card.dart';

class GoalOptionsSection extends StatelessWidget {
  final String selectedGoalId;
  final ValueChanged<GoalOptionModel>? onGoalSelected;

  const GoalOptionsSection({
    super.key,
    this.selectedGoalId = 'get_strong',
    this.onGoalSelected,
  });

  List<GoalOptionModel> _getGoals() => [
    GoalOptionModel(
      id: 'build_muscle',
      title: LocaleKeys.build_muscle_title.tr(),
      description: LocaleKeys.build_muscle_desc.tr(),
      icon: Icons.open_in_full_rounded,
    ),
    GoalOptionModel(
      id: 'get_strong',
      title: LocaleKeys.get_strong_title.tr(),
      description: LocaleKeys.get_strong_desc.tr(),
      icon: Icons.fitness_center_rounded,
    ),
    GoalOptionModel(
      id: 'general_fitness',
      title: LocaleKeys.general_fitness_title.tr(),
      description: LocaleKeys.general_fitness_desc.tr(),
      icon: Icons.directions_run_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final goals = _getGoals();

    return Column(
      children: [
        for (int i = 0; i < goals.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          GoalCard(
            goal: goals[i],
            isSelected: selectedGoalId == goals[i].id,
            onTap: () => onGoalSelected?.call(goals[i]),
          ),
        ],
      ],
    );
  }
}
