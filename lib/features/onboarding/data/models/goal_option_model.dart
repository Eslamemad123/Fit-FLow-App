import 'package:flutter/material.dart';

class GoalOptionModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Map<String, String> titleTranslations;
  final Map<String, String> subtitleTranslations;

  const GoalOptionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.titleTranslations = const {},
    this.subtitleTranslations = const {},
  });

  factory GoalOptionModel.fromJson(
    Map<String, dynamic> json, {
    String languageCode = 'en',
  }) {
    final id = json['id'] as String? ?? '';
    final titleRaw = json['title'];
    final subtitleRaw = json['subtitle'];

    final Map<String, String> titles = titleRaw is Map
        ? titleRaw.map((k, v) => MapEntry(k.toString(), v.toString()))
        : {};
    final Map<String, String> subtitles = subtitleRaw is Map
        ? subtitleRaw.map((k, v) => MapEntry(k.toString(), v.toString()))
        : {};

    final title = titles[languageCode] ??
        titles['en'] ??
        (titleRaw is String ? titleRaw : id);
    final description = subtitles[languageCode] ??
        subtitles['en'] ??
        (subtitleRaw is String ? subtitleRaw : '');

    return GoalOptionModel(
      id: id,
      title: title,
      description: description,
      icon: iconForGoal(id),
      titleTranslations: titles,
      subtitleTranslations: subtitles,
    );
  }

  GoalOptionModel localized(String languageCode) {
    return GoalOptionModel(
      id: id,
      title: titleTranslations[languageCode] ??
          titleTranslations['en'] ??
          title,
      description: subtitleTranslations[languageCode] ??
          subtitleTranslations['en'] ??
          description,
      icon: icon,
      titleTranslations: titleTranslations,
      subtitleTranslations: subtitleTranslations,
    );
  }

  static IconData iconForGoal(String id) => switch (id) {
    'build_muscle' => Icons.open_in_full_rounded,
    'get_strong' => Icons.fitness_center_rounded,
    'general_fitness' => Icons.directions_run_rounded,
    _ => Icons.fitness_center_rounded,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalOptionModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          icon == other.icon;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ description.hashCode ^ icon.hashCode;
}
