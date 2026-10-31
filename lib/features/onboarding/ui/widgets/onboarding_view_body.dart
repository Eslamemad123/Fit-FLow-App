import 'package:flutter/material.dart';

import '../../data/models/goal_option_model.dart';
import '../../data/models/onboarding_data_model.dart';
import '../../data/models/onboarding_input_model.dart';
import '../../data/repos/onboarding_repository.dart';
import 'onboarding_availability_section.dart';
import 'onboarding_continue_button.dart';
import 'onboarding_footer_text.dart';
import 'onboarding_goal_section.dart';
import 'onboarding_header.dart';
import 'onboarding_recommendation_card.dart';
import 'onboarding_title_section.dart';

class OnboardingViewBody extends StatefulWidget {
  final OnboardingInputModel inputModel;
  final OnboardingRepository? repository;
  final ValueChanged<OnboardingDataModel>? onCompleted;

  const OnboardingViewBody({
    super.key,
    required this.inputModel,
    this.repository,
    this.onCompleted,
  });

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final OnboardingRepository _repository;
  List<GoalOptionModel> _goals = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? OnboardingRepository();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final loaded = await _repository.getGoals();
    if (mounted) {
      setState(() {
        _goals = loaded;
      });
    }
  }

  Future<void> _handleContinue() async {
    setState(() {
      _isLoading = true;
    });

    final onboardingData = widget.inputModel.toDataModel();

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
          OnboardingGoalSection(
            inputModel: widget.inputModel,
            goals: _goals.isNotEmpty ? _goals : null,
            onGoalChanged: (goalId) {
              setState(() {});
            },
          ),
          const SizedBox(height: 20),
          OnboardingAvailabilitySection(
            inputModel: widget.inputModel,
            onAvailabilityDaysChanged: (days) {
              setState(() {});
            },
          ),
          if (widget.inputModel.availabilityDays == 3) ...[
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
