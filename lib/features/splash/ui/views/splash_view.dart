import 'package:fit_flow_ai/core/routes/routes.dart';
import 'package:fit_flow_ai/core/theme/app_colors.dart';
import 'package:fit_flow_ai/features/splash/ui/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(Routes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(child: SplashViewBody()),
      ),
    );
  }
}
