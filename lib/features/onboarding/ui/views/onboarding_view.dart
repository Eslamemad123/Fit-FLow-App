import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/onboarding_data_model.dart';
import '../../data/models/onboarding_input_model.dart';
import '../../data/repos/onboarding_repository.dart';
import '../widgets/onboarding_view_body.dart';

export '../../data/models/onboarding_input_model.dart';

class OnboardingView extends StatefulWidget {
  final OnboardingRepository? repository;
  final ValueChanged<OnboardingDataModel>? onCompleted;

  const OnboardingView({
    super.key,
    this.repository,
    this.onCompleted,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingInputModel _inputModel = OnboardingInputModel();

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
            inputModel: _inputModel,
            repository: widget.repository,
            onCompleted: widget.onCompleted,
          ),
        ),
      ),
    );
  }
}
