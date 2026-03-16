import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasource {
  final SharedPreferences _prefs;

  static const _onboardingDoneKey = 'onboarding_done';

  OnboardingLocalDatasource(this._prefs);

  bool get isOnboardingCompleted =>
      _prefs.getBool(_onboardingDoneKey) ?? false;

  Future<void> completeOnboarding() =>
      _prefs.setBool(_onboardingDoneKey, true);
}
