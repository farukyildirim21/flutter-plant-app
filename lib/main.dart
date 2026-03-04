import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/dio_client.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.instance.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final prefs = await SharedPreferences.getInstance();
  final onboardingDone = prefs.getBool('onboarding_done') ?? false;

  runApp(PlantApp(onboardingDone: onboardingDone));
}

class PlantApp extends StatelessWidget {
  PlantApp({super.key, required this.onboardingDone});

  final bool onboardingDone;

  late final _appRouter = AppRouter(onboardingDone: onboardingDone);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlantApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _appRouter.config(),
    );
  }
}
