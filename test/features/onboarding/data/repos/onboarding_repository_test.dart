import 'dart:convert';
import 'package:fit_flow_ai/features/onboarding/data/models/onboarding_data_model.dart';
import 'package:fit_flow_ai/features/onboarding/data/repos/onboarding_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockJson = jsonEncode({
    'goals': [
      {
        'id': 'get_strong',
        'title': {'en': 'Get Strong', 'ar': 'زيادة القوة'},
        'subtitle': {
          'en': 'Build raw strength and muscle power',
          'ar': 'بناء قوة خام وطاقة عضلية',
        },
      },
      {
        'id': 'build_muscle',
        'title': {'en': 'Build Muscle', 'ar': 'بناء العضلات'},
        'subtitle': {
          'en': 'Focus on hypertrophy and muscle growth',
          'ar': 'التركيز على التضخيم والنمو العضلي',
        },
      },
      {
        'id': 'general_fitness',
        'title': {'en': 'General Fitness', 'ar': 'اللياقة العامة'},
        'subtitle': {
          'en': 'Improve cardiovascular health and endurance',
          'ar': 'تحسين صحة القلب وقوة التحمل',
        },
      },
    ],
    'plans': [
      {
        'plan_id': 'plan_01',
        'goal_id': 'get_strong',
        'availability_days': 2,
        'workout_days': [],
      },
      {
        'plan_id': 'plan_02',
        'goal_id': 'get_strong',
        'availability_days': 3,
        'workout_days': [],
      },
    ],
  });

  group('OnboardingRepository', () {
    test('getGoals loads and sorts goals to match design layout', () async {
      final repository = OnboardingRepository(
        assetLoader: (path) async => mockJson,
      );

      final goals = await repository.getGoals(languageCode: 'en');

      expect(goals.length, 3);
      expect(goals[0].id, 'build_muscle');
      expect(goals[0].title, 'Build Muscle');
      expect(goals[0].description, 'Focus on hypertrophy and muscle growth');

      expect(goals[1].id, 'get_strong');
      expect(goals[1].title, 'Get Strong');
      expect(goals[1].description, 'Build raw strength and muscle power');

      expect(goals[2].id, 'general_fitness');
      expect(goals[2].title, 'General Fitness');
      expect(goals[2].description, 'Improve cardiovascular health and endurance');
    });

    test('getGoals supports Arabic localization', () async {
      final repository = OnboardingRepository(
        assetLoader: (path) async => mockJson,
      );

      final goals = await repository.getGoals(languageCode: 'ar');

      expect(goals[0].localized('ar').title, 'بناء العضلات');
      expect(goals[0].localized('ar').description,
          'التركيز على التضخيم والنمو العضلي');
      expect(goals[1].localized('ar').title, 'زيادة القوة');
      expect(goals[1].localized('ar').description,
          'بناء قوة خام وطاقة عضلية');
    });

    test('saveOnboardingSelection fetches matching plan', () async {
      final repository = OnboardingRepository(
        assetLoader: (path) async => mockJson,
      );

      const onboardingData = OnboardingDataModel(
        goalId: 'get_strong',
        availabilityDays: 3,
      );

      final plan = await repository.saveOnboardingSelection(onboardingData);

      expect(plan, isNotNull);
      expect(plan!.planId, 'plan_02');
      expect(repository.savedOnboardingData, onboardingData);
      expect(repository.selectedPlan, plan);
    });
  });
}

