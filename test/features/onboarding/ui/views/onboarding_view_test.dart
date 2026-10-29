import 'package:fit_flow_ai/features/onboarding/ui/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OnboardingView renders all key UI components', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingView(),
      ),
    );

    expect(find.text('FitFlow'), findsOneWidget);
    expect(find.text('Select Your Goal'), findsOneWidget);
    expect(find.text('Build Muscle'), findsOneWidget);
    expect(find.text('Get Strong'), findsOneWidget);
    expect(find.text('General Fitness'), findsOneWidget);
    expect(find.text('Weekly Availability'), findsOneWidget);
    expect(find.text('3 Days'), findsOneWidget);
    expect(find.text('RECOMMENDED'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('YOU CAN CHANGE THIS LATER IN PROFILE'), findsOneWidget);
  });
}
