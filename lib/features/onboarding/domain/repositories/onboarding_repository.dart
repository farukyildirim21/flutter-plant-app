abstract interface class OnboardingRepository {
  bool get isOnboardingCompleted;
  Future<void> completeOnboarding();
}
