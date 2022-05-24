import 'package:breaking_bad_app/features/breaking_bad_api_call/breaking_bad_injection_container.dart'
    as di;
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/pages/splash_screen.dart';
import 'package:breaking_bad_app/utils/app_theme.dart';
import 'package:breaking_bad_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  di.initalizeBreakingBadApiFeature();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
