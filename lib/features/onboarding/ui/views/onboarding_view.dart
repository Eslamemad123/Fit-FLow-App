import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/onboarding_data_model.dart';
import '../../data/repos/onboarding_repository.dart';
import '../widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingRepository? repository;
  final ValueChanged<OnboardingDataModel>? onCompleted;

  const OnboardingView({
    super.key,
    this.repository,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: OnboardingViewBody(
            repository: repository,
            onCompleted: onCompleted,
          ),
        ),
      ),
    );
  }
}
