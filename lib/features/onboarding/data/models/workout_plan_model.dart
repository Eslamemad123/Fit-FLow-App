import 'workout_day_model.dart';

class WorkoutPlanModel {
  final String planId;
  final String goalId;
  final int availabilityDays;
  final List<WorkoutDayModel> workoutDays;

  const WorkoutPlanModel({
    required this.planId,
    required this.goalId,
    required this.availabilityDays,
    required this.workoutDays,
  });

  Map<String, dynamic> toJson() => {
    'plan_id': planId,
    'goal_id': goalId,
    'availability_days': availabilityDays,
    'workout_days': workoutDays.map((e) => e.toJson()).toList(),
  };

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    return WorkoutPlanModel(
      planId: json['plan_id'] as String,
      goalId: json['goal_id'] as String,
      availabilityDays: json['availability_days'] as int,
      workoutDays: (json['workout_days'] as List<dynamic>)
          .map((e) => WorkoutDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutPlanModel &&
          runtimeType == other.runtimeType &&
          planId == other.planId;

  @override
  int get hashCode => planId.hashCode;
}

