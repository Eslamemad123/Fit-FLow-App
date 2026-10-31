import 'package:easy_localization/easy_localization.dart';
import 'package:fit_flow_ai/features/onboarding/ui/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestAssetLoader extends AssetLoader {
  const TestAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    return {
      'app_title': 'FitFlow',
      'splash_subtitle': 'ELEVATE YOUR MOVEMENT',
      'language_en': 'English',
      'language_ar': 'Arabic',
      'select_your_goal': 'Select Your Goal',
      'select_your_goal_subtitle':
          'Customize your journey for precision performance.',
      'build_muscle_title': 'Build Muscle',
      'build_muscle_desc': 'Focus on hypertrophy and strength.',
      'get_strong_title': 'Get Strong',
      'get_strong_desc': 'Prioritize heavy lifting.',
      'general_fitness_title': 'General Fitness',
      'general_fitness_desc': 'Balanced health and mobility.',
      'recommended': 'RECOMMENDED',
      'optimal_recovery_cycle': 'Optimal recovery cycle',
      'weekly_availability': 'Weekly Availability',
      'days_2': '2 Days',
      'days_3': '3 Days',
      'days_4': '4 Days',
      'days_5_plus': '5+ Days',
      'continue_button': 'Continue',
      'change_later_in_profile': 'YOU CAN CHANGE THIS LATER IN PROFILE',
    };
  }
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/shared_preferences');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{};
      }
      return null;
    });
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('OnboardingView renders all key UI components', (tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ar')],
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: false,
        assetLoader: const TestAssetLoader(),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: const OnboardingView(),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

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
