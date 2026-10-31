import 'workout_exercise_model.dart';

class WorkoutDayModel {
  final int dayNumber;
  final Map<String, String> workoutTitle;
  final List<WorkoutExerciseModel> workoutExercises;

  const WorkoutDayModel({
    required this.dayNumber,
    required this.workoutTitle,
    required this.workoutExercises,
  });

  Map<String, dynamic> toJson() => {
    'day_number': dayNumber,
    'workout_title': workoutTitle,
    'workout_exercises': workoutExercises.map((e) => e.toJson()).toList(),
  };

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDayModel(
      dayNumber: json['day_number'] as int,
      workoutTitle: Map<String, String>.from(json['workout_title'] as Map),
      workoutExercises: (json['workout_exercises'] as List<dynamic>)
          .map((e) => WorkoutExerciseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutDayModel &&
          runtimeType == other.runtimeType &&
          dayNumber == other.dayNumber;

  @override
  int get hashCode => dayNumber.hashCode;
}

