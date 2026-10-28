import 'package:flutter/material.dart';
import 'features/splash/ui/views/splash_view.dart';

void main() {
  runApp(const FitFlowApp());
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitFlow',
      home: SplashView(),
    );
  }
}
