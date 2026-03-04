import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String title,
    required int rank,
    required CategoryImageModel image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class CategoryImageModel with _$CategoryImageModel {
  const factory CategoryImageModel({
    required String url,
  }) = _CategoryImageModel;

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageModelFromJson(json);
}
