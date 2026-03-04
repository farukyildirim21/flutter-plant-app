import 'dart:convert';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/category_model.dart';
import '../models/question_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._dioClient);

  final DioClient _dioClient;

  dynamic _decode(dynamic raw) =>
      raw is String ? jsonDecode(raw) : raw;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dioClient.get(AppConstants.categoriesEndpoint);
    final decoded = _decode(response.data);
    final data = decoded['data'] as List;
    return data
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final response = await _dioClient.get(AppConstants.questionsEndpoint);
    final data = _decode(response.data) as List;
    return data
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
