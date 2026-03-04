import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(const HomeState.initial()) {
    loadData();
  }

  final HomeRepository _homeRepository;

  Future<void> loadData() async {
    emit(const HomeState.loading());
    try {
      final categories = await _homeRepository.getCategories();
      final questions = await _homeRepository.getQuestions();
      emit(HomeState.loaded(categories: categories, questions: questions));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
