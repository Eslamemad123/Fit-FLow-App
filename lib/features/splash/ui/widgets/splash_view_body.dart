import 'package:flutter/material.dart';
import 'splash_logo.dart';
import 'splash_subtitle.dart';
import 'splash_title.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SplashLogo(),
          SizedBox(height: 20),
          SplashTitle(),
          SizedBox(height: 8),
          SplashSubtitle(),
        ],
      ),
    );
  }
}
