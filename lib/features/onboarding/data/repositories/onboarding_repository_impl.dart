import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatasource _datasource;

  OnboardingRepositoryImpl(this._datasource);

  @override
  bool get isOnboardingCompleted => _datasource.isOnboardingCompleted;

  @override
  Future<void> completeOnboarding() => _datasource.completeOnboarding();
}
