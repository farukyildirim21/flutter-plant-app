import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  static const int pageCount = 2;

  OnboardingCubit() : super(0);

  void nextPage() {
    if (state < pageCount - 1) emit(state + 1);
  }

  void goToPage(int page) => emit(page);
}
