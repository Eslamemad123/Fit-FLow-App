import 'package:flutter/material.dart';

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

  static const List<GoalOptionModel> _goals = [
    GoalOptionModel(
      title: 'Build Muscle',
      description: 'Focus on hypertrophy and strength.',
      icon: Icons.open_in_full_rounded,
    ),
    GoalOptionModel(
      title: 'Get Strong',
      description: 'Prioritize heavy lifting.',
      icon: Icons.fitness_center_rounded,
    ),
    GoalOptionModel(
      title: 'General Fitness',
      description: 'Balanced health and mobility.',
      icon: Icons.directions_run_rounded,
    ),
  ];

  void _onGoalTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onGoalSelected?.call(_goals[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < _goals.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          GoalCard(
            goal: _goals[i],
            isSelected: _selectedIndex == i,
            onTap: () => _onGoalTapped(i),
          ),
        ],
      ],
    );
  }
}
