import 'package:flutter/material.dart';

import 'language_dropdown.dart';
import 'onboarding_header_title.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnboardingHeaderTitle(),
        LanguageDropdown(),
      ],
    );
  }
}
