# Flutter UI Architecture & Widget Composition Rules

- **Never create helper functions that return widgets**:
  - Do not create methods or functions returning `Widget` (e.g., `_buildHeader()`, `_buildItem()`, `_buildCard()`).
  - Do not use widget-returning functions for composition or code organization.

- **Always use dedicated custom widgets**:
  - Every distinct or reusable UI component must be implemented as a dedicated `StatelessWidget` or `StatefulWidget`.
  - Each custom widget must have a single, clear responsibility.
  - Every public custom widget constructor must accept a named `{super.key}` parameter.
  - Prefer `const` constructors and `const` widget instances wherever possible.

- **Each custom widget must have its own separate file**:
  - Store screen views in `lib/features/<feature_name>/ui/views/`.
  - Store body widgets in `lib/features/<feature_name>/ui/widgets/<feature>_view_body.dart`.
  - Store modular UI widgets in `lib/features/<feature_name>/ui/widgets/<widget_name>.dart`.
  - Do not declare multiple custom widget classes at the bottom of another screen's file.

