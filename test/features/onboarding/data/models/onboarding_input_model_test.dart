import 'package:fit_flow_ai/features/onboarding/data/models/onboarding_data_model.dart';
import 'package:fit_flow_ai/features/onboarding/data/models/onboarding_input_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingInputModel', () {
    test('initializes with default values', () {
      final model = OnboardingInputModel();
      expect(model.goalId, 'get_strong');
      expect(model.availabilityDays, 3);
      expect(model.planId, 'plan_02');
    });

    test('updates goal correctly', () {
      final model = OnboardingInputModel();
      model.updateGoal('build_muscle');
      expect(model.goalId, 'build_muscle');
      expect(model.planId, 'plan_06');
    });

    test('updates availability days correctly', () {
      final model = OnboardingInputModel();
      model.updateAvailabilityDays(4);
      expect(model.availabilityDays, 4);
      expect(model.planId, 'plan_03');
    });

    test('maps all 12 goal and days combinations to correct plan ids', () {
      final expectedMappings = <(String, int), String>{
        ('get_strong', 2): 'plan_01',
        ('get_strong', 3): 'plan_02',
        ('get_strong', 4): 'plan_03',
        ('get_strong', 5): 'plan_04',
        ('build_muscle', 2): 'plan_05',
        ('build_muscle', 3): 'plan_06',
        ('build_muscle', 4): 'plan_07',
        ('build_muscle', 5): 'plan_08',
        ('general_fitness', 2): 'plan_09',
        ('general_fitness', 3): 'plan_10',
        ('general_fitness', 4): 'plan_11',
        ('general_fitness', 5): 'plan_12',
      };

      for (final entry in expectedMappings.entries) {
        final model = OnboardingInputModel(
          goalId: entry.key.$1,
          availabilityDays: entry.key.$2,
        );
        expect(model.planId, entry.value);
        expect(
          OnboardingInputModel.mapGoalAndDaysToPlanId(
            entry.key.$1,
            entry.key.$2,
          ),
          entry.value,
        );
      }
    });

    test('clamps availability days outside 2-5 range', () {
      expect(
        OnboardingInputModel.mapGoalAndDaysToPlanId('get_strong', 1),
        'plan_01',
      );
      expect(
        OnboardingInputModel.mapGoalAndDaysToPlanId('get_strong', 7),
        'plan_04',
      );
    });

    test('falls back to default plan for unknown goal', () {
      expect(
        OnboardingInputModel.mapGoalAndDaysToPlanId('unknown_goal', 3),
        'plan_02',
      );
    });

    test('converts to OnboardingDataModel', () {
      final model = OnboardingInputModel(
        goalId: 'general_fitness',
        availabilityDays: 5,
      );
      final dataModel = model.toDataModel();
      expect(dataModel, isA<OnboardingDataModel>());
      expect(dataModel.goalId, 'general_fitness');
      expect(dataModel.availabilityDays, 5);
    });

    test('supports copyWith', () {
      final model = OnboardingInputModel(
        goalId: 'get_strong',
        availabilityDays: 2,
      );
      final copied = model.copyWith(goalId: 'build_muscle');
      expect(copied.goalId, 'build_muscle');
      expect(copied.availabilityDays, 2);
    });
  });
}

