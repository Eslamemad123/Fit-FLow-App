class WorkoutExerciseModel {
  final String exerciseId;
  final int sets;
  final String reps;
  final int restSeconds;

  const WorkoutExerciseModel({
    required this.exerciseId,
    required this.sets,
    required this.reps,
    required this.restSeconds,
  });

  Map<String, dynamic> toJson() => {
    'exercise_id': exerciseId,
    'sets': sets,
    'reps': reps,
    'rest_seconds': restSeconds,
  };

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      exerciseId: json['exercise_id'] as String,
      sets: json['sets'] as int,
      reps: json['reps'].toString(),
      restSeconds: json['rest_seconds'] as int,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutExerciseModel &&
          runtimeType == other.runtimeType &&
          exerciseId == other.exerciseId &&
          sets == other.sets &&
          reps == other.reps &&
          restSeconds == other.restSeconds;

  @override
  int get hashCode =>
      exerciseId.hashCode ^ sets.hashCode ^ reps.hashCode ^ restSeconds.hashCode;
}

