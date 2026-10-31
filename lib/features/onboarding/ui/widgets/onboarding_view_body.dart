import 'package:flutter/material.dart';

import '../../data/models/onboarding_data_model.dart';
import '../../data/repos/onboarding_repository.dart';
import 'goal_options_section.dart';
import 'onboarding_continue_button.dart';
import 'onboarding_footer_text.dart';
import 'onboarding_header.dart';
import 'onboarding_recommendation_card.dart';
import 'onboarding_title_section.dart';
import 'weekly_availability_section.dart';

class OnboardingViewBody extends StatefulWidget {
  final OnboardingRepository? repository;
  final ValueChanged<OnboardingDataModel>? onCompleted;

  const OnboardingViewBody({
    super.key,
    this.repository,
    this.onCompleted,
  });

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  static const List<int> _availabilityDaysMap = [2, 3, 4, 5];

  late final OnboardingRepository _repository;
  String _selectedGoalId = 'get_strong';
  int _selectedAvailabilityIndex = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? OnboardingRepository();
  }

  int get _selectedAvailabilityDays =>
      _availabilityDaysMap[_selectedAvailabilityIndex];

  Future<void> _handleContinue() async {
    setState(() {
      _isLoading = true;
    });

    final onboardingData = OnboardingDataModel(
      goalId: _selectedGoalId,
      availabilityDays: _selectedAvailabilityDays,
    );

    try {
      await _repository.saveOnboardingSelection(onboardingData);
      if (!mounted) return;
      widget.onCompleted?.call(onboardingData);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OnboardingHeader(),
          const SizedBox(height: 14),
          const OnboardingTitleSection(),
          const SizedBox(height: 20),
          GoalOptionsSection(
            selectedGoalId: _selectedGoalId,
            onGoalSelected: (goal) {
              setState(() {
                _selectedGoalId = goal.id;
              });
            },
          ),
          const SizedBox(height: 20),
          WeeklyAvailabilitySection(
            selectedIndex: _selectedAvailabilityIndex,
            onAvailabilityIndexChanged: (index) {
              setState(() {
                _selectedAvailabilityIndex = index;
              });
            },
          ),
          if (_selectedAvailabilityIndex == 1) ...[
            const SizedBox(height: 20),
            const OnboardingRecommendationCard(),
          ],
          const SizedBox(height: 24),
          OnboardingContinueButton(
            isLoading: _isLoading,
            onPressed: _handleContinue,
          ),
          const SizedBox(height: 14),
          const OnboardingFooterText(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
