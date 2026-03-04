import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/category_model.dart';
import '../../data/models/question_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<CategoryModel> categories,
    required List<QuestionModel> questions,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
