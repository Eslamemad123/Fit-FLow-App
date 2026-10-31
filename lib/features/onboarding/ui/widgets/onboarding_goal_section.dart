import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/models/goal_option_model.dart';
import '../../data/models/onboarding_input_model.dart';
import 'goal_card.dart';

class OnboardingGoalSection extends StatelessWidget {
  final OnboardingInputModel inputModel;
  final ValueChanged<String>? onGoalChanged;
  final List<GoalOptionModel>? goals;

  const OnboardingGoalSection({
    super.key,
    required this.inputModel,
    this.onGoalChanged,
    this.goals,
  });

  static const List<GoalOptionModel> _defaultGoals = [
    GoalOptionModel(
      id: 'build_muscle',
      title: 'Build Muscle',
      description: 'Focus on hypertrophy and muscle growth',
      icon: Icons.open_in_full_rounded,
      titleTranslations: {
        'en': 'Build Muscle',
        'ar': 'بناء العضلات',
      },
      subtitleTranslations: {
        'en': 'Focus on hypertrophy and muscle growth',
        'ar': 'التركيز على التضخيم والنمو العضلي',
      },
    ),
    GoalOptionModel(
      id: 'get_strong',
      title: 'Get Strong',
      description: 'Build raw strength and muscle power',
      icon: Icons.fitness_center_rounded,
      titleTranslations: {
        'en': 'Get Strong',
        'ar': 'زيادة القوة',
      },
      subtitleTranslations: {
        'en': 'Build raw strength and muscle power',
        'ar': 'بناء قوة خام وطاقة عضلية',
      },
    ),
    GoalOptionModel(
      id: 'general_fitness',
      title: 'General Fitness',
      description: 'Improve cardiovascular health and endurance',
      icon: Icons.directions_run_rounded,
      titleTranslations: {
        'en': 'General Fitness',
        'ar': 'اللياقة العامة',
      },
      subtitleTranslations: {
        'en': 'Improve cardiovascular health and endurance',
        'ar': 'تحسين صحة القلب وقوة التحمل',
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;
    final activeGoals = (goals != null && goals!.isNotEmpty)
        ? goals!.map((g) => g.localized(currentLang)).toList()
        : _defaultGoals.map((g) => g.localized(currentLang)).toList();

    return Column(
      children: [
        for (int i = 0; i < activeGoals.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          GoalCard(
            goal: activeGoals[i],
            isSelected: inputModel.goalId == activeGoals[i].id,
            onTap: () {
              inputModel.updateGoal(activeGoals[i].id);
              onGoalChanged?.call(activeGoals[i].id);
            },
          ),
        ],
      ],
    );
  }
}
