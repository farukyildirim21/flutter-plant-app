import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/dio_client.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'features/onboarding/domain/repositories/onboarding_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.instance.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final prefs = await SharedPreferences.getInstance();
  final onboardingRepository = OnboardingRepositoryImpl(
    OnboardingLocalDatasource(prefs),
  );

  runApp(PlantApp(onboardingRepository: onboardingRepository));
}

class PlantApp extends StatelessWidget {
  PlantApp({super.key, required this.onboardingRepository});

  final OnboardingRepository onboardingRepository;

  late final _appRouter = AppRouter(
    onboardingDone: onboardingRepository.isOnboardingCompleted,
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<OnboardingRepository>.value(
      value: onboardingRepository,
      child: MaterialApp.router(
        title: 'PlantApp',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
