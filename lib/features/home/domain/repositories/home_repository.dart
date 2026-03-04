import '../../data/models/category_model.dart';
import '../../data/models/question_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<QuestionModel>> getQuestions();
}
