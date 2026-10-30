import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../../data/models/goal_option_model.dart';
import 'goal_card.dart';

class GoalOptionsSection extends StatefulWidget {
  final ValueChanged<GoalOptionModel>? onGoalSelected;

  const GoalOptionsSection({super.key, this.onGoalSelected});

  @override
  State<GoalOptionsSection> createState() => _GoalOptionsSectionState();
}

class _GoalOptionsSectionState extends State<GoalOptionsSection> {
  int _selectedIndex = 1;

  List<GoalOptionModel> _getGoals() => [
    GoalOptionModel(
      title: LocaleKeys.build_muscle_title.tr(),
      description: LocaleKeys.build_muscle_desc.tr(),
      icon: Icons.open_in_full_rounded,
    ),
    GoalOptionModel(
      title: LocaleKeys.get_strong_title.tr(),
      description: LocaleKeys.get_strong_desc.tr(),
      icon: Icons.fitness_center_rounded,
    ),
    GoalOptionModel(
      title: LocaleKeys.general_fitness_title.tr(),
      description: LocaleKeys.general_fitness_desc.tr(),
      icon: Icons.directions_run_rounded,
    ),
  ];

  void _onGoalTapped(int index, List<GoalOptionModel> goals) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onGoalSelected?.call(goals[index]);
  }

  @override
  Widget build(BuildContext context) {
    final goals = _getGoals();

    return Column(
      children: [
        for (int i = 0; i < goals.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          GoalCard(
            goal: goals[i],
            isSelected: _selectedIndex == i,
            onTap: () => _onGoalTapped(i, goals),
          ),
        ],
      ],
    );
  }
}
