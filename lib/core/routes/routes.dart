import 'package:go_router/go_router.dart';
import '../../features/onboarding/ui/views/onboarding_view.dart';
import '../../features/splash/ui/views/splash_view.dart';

abstract class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static final GoRouter routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );

}
