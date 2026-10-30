import 'package:flutter/material.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const FitFlowApp());
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FitFlow',
      
      routerConfig: Routes.routes,
    );
  }
}
