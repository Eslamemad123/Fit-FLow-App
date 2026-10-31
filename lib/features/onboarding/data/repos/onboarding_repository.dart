import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/onboarding_data_model.dart';
import '../models/workout_plan_model.dart';

class OnboardingRepository {
  final String assetPath;
  final Future<String> Function(String path)? assetLoader;

  List<WorkoutPlanModel>? _cachedPlans;
  OnboardingDataModel? _savedOnboardingData;
  WorkoutPlanModel? _selectedPlan;

  OnboardingRepository({
    this.assetPath = 'assets/data.json',
    this.assetLoader,
  });

  OnboardingDataModel? get savedOnboardingData => _savedOnboardingData;
  WorkoutPlanModel? get selectedPlan => _selectedPlan;

  Future<List<WorkoutPlanModel>> getPlans() async {
    if (_cachedPlans != null) {
      return _cachedPlans!;
    }

    final jsonString = assetLoader != null
        ? await assetLoader!(assetPath)
        : await rootBundle.loadString(assetPath);

    final Map<String, dynamic> data =
        jsonDecode(jsonString) as Map<String, dynamic>;
    final plansJson = data['plans'] as List<dynamic>;

    _cachedPlans = plansJson
        .map((e) => WorkoutPlanModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return _cachedPlans!;
  }

  Future<WorkoutPlanModel?> getPlanForOnboarding(
    OnboardingDataModel onboardingData,
  ) async {
    final plans = await getPlans();
    for (final plan in plans) {
      if (plan.goalId == onboardingData.goalId &&
          plan.availabilityDays == onboardingData.availabilityDays) {
        return plan;
      }
    }
    return null;
  }

  Future<WorkoutPlanModel?> saveOnboardingSelection(
    OnboardingDataModel onboardingData,
  ) async {
    _savedOnboardingData = onboardingData;
    _selectedPlan = await getPlanForOnboarding(onboardingData);
    return _selectedPlan;
  }
}

