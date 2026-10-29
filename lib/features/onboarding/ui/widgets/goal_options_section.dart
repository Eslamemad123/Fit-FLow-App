import 'package:flutter/material.dart';

import '../../data/models/goal_option_model.dart';
import 'goal_card.dart';

class GoalOptionsSection extends StatelessWidget {
  const GoalOptionsSection({super.key});

  static const List<GoalOptionModel> _goals = [
    GoalOptionModel(
      title: 'Build Muscle',
      description: 'Focus on hypertrophy and strength.',
      icon: Icons.open_in_full_rounded,
    ),
    GoalOptionModel(
      title: 'Get Strong',
      description: 'Prioritize heavy lifting and power.',
      icon: Icons.fitness_center_rounded,
    ),
    GoalOptionModel(
      title: 'General Fitness',
      description: 'Balanced health and mobility.',
      icon: Icons.directions_run_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoalCard(goal: _goals[0], isSelected: false),
        const SizedBox(height: 12),
        GoalCard(goal: _goals[1], isSelected: true),
        const SizedBox(height: 12),
        GoalCard(goal: _goals[2], isSelected: false),
      ],
    );
  }
}
