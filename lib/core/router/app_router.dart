import 'package:auto_route/auto_route.dart';
import '../../features/get_started/presentation/screens/get_started_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/paywall/presentation/screens/paywall_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({this.onboardingDone = false});

  final bool onboardingDone;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GetStartedRoute.page, initial: onboardingDone),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: PaywallRoute.page),
    AutoRoute(page: HomeRoute.page, initial: !onboardingDone),
  ];
}
