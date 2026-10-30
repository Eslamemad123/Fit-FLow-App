import 'package:flutter/material.dart';

import 'goal_options_section.dart';
import 'onboarding_continue_button.dart';
import 'onboarding_footer_text.dart';
import 'onboarding_header.dart';
import 'onboarding_recommendation_card.dart';
import 'onboarding_title_section.dart';
import 'weekly_availability_section.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  String _selectedDays = '3 Days';

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
          const GoalOptionsSection(),
          const SizedBox(height: 20),
          WeeklyAvailabilitySection(
            onAvailabilityChanged: (days) {
              setState(() {
                _selectedDays = days;
              });
            },
          ),
          if (_selectedDays == '3 Days') ...[
            const SizedBox(height: 20),
            const OnboardingRecommendationCard(),
          ],
          const SizedBox(height: 24),
          const OnboardingContinueButton(),
          const SizedBox(height: 14),
          const OnboardingFooterText(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
