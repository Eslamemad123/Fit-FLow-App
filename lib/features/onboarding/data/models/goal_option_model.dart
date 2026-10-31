import 'package:flutter/material.dart';

class GoalOptionModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  const GoalOptionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}
