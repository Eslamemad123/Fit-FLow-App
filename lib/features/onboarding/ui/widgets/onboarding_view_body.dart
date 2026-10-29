import 'package:flutter/material.dart';

import 'goal_options_section.dart';
import 'onboarding_continue_button.dart';
import 'onboarding_footer_text.dart';
import 'onboarding_header.dart';
import 'onboarding_recommendation_card.dart';
import 'onboarding_title_section.dart';
import 'weekly_availability_section.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OnboardingHeader(),
          SizedBox(height: 14),
          OnboardingTitleSection(),
          SizedBox(height: 20),
          GoalOptionsSection(),
          SizedBox(height: 20),
          WeeklyAvailabilitySection(),
          SizedBox(height: 20),
          OnboardingRecommendationCard(),
          SizedBox(height: 24),
          OnboardingContinueButton(),
          SizedBox(height: 14),
          OnboardingFooterText(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
