class OnboardingDataModel {
  final String goalId;
  final int availabilityDays;

  const OnboardingDataModel({
    required this.goalId,
    required this.availabilityDays,
  });

  Map<String, dynamic> toJson() => {
    'goal_id': goalId,
    'availability_days': availabilityDays,
  };

  factory OnboardingDataModel.fromJson(Map<String, dynamic> json) {
    return OnboardingDataModel(
      goalId: json['goal_id'] as String,
      availabilityDays: json['availability_days'] as int,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingDataModel &&
          runtimeType == other.runtimeType &&
          goalId == other.goalId &&
          availabilityDays == other.availabilityDays;

  @override
  int get hashCode => goalId.hashCode ^ availabilityDays.hashCode;
}

