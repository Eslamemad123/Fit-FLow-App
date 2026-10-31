import 'onboarding_data_model.dart';

class OnboardingInputModel {
  String goalId;
  int availabilityDays;

  OnboardingInputModel({
    this.goalId = 'get_strong',
    this.availabilityDays = 3,
  });

  void updateGoal(String newGoalId) {
    goalId = newGoalId;
  }

  void updateAvailabilityDays(int days) {
    availabilityDays = days;
  }

  String get planId => mapToPlanId();

  String mapToPlanId() => mapGoalAndDaysToPlanId(goalId, availabilityDays);

  static String mapGoalAndDaysToPlanId(String goalId, int availabilityDays) {
    final normalizedDays = availabilityDays.clamp(2, 5);
    return switch ((goalId, normalizedDays)) {
      ('get_strong', 2) => 'plan_01',
      ('get_strong', 3) => 'plan_02',
      ('get_strong', 4) => 'plan_03',
      ('get_strong', 5) => 'plan_04',
      ('build_muscle', 2) => 'plan_05',
      ('build_muscle', 3) => 'plan_06',
      ('build_muscle', 4) => 'plan_07',
      ('build_muscle', 5) => 'plan_08',
      ('general_fitness', 2) => 'plan_09',
      ('general_fitness', 3) => 'plan_10',
      ('general_fitness', 4) => 'plan_11',
      ('general_fitness', 5) => 'plan_12',
      _ => 'plan_02',
    };
  }

  OnboardingInputModel copyWith({
    String? goalId,
    int? availabilityDays,
  }) {
    return OnboardingInputModel(
      goalId: goalId ?? this.goalId,
      availabilityDays: availabilityDays ?? this.availabilityDays,
    );
  }

  OnboardingDataModel toDataModel() {
    return OnboardingDataModel(
      goalId: goalId,
      availabilityDays: availabilityDays,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingInputModel &&
          runtimeType == other.runtimeType &&
          goalId == other.goalId &&
          availabilityDays == other.availabilityDays;

  @override
  int get hashCode => goalId.hashCode ^ availabilityDays.hashCode;

  @override
  String toString() =>
      'OnboardingInputModel(goalId: $goalId, availabilityDays: $availabilityDays, planId: $planId)';
}

