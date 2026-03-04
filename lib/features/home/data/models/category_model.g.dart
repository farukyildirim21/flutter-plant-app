// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      title: json['title'] as String,
      rank: (json['rank'] as num).toInt(),
      image: CategoryImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'rank': instance.rank,
      'image': instance.image,
    };

_$CategoryImageModelImpl _$$CategoryImageModelImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryImageModelImpl(url: json['url'] as String);

Map<String, dynamic> _$$CategoryImageModelImplToJson(
  _$CategoryImageModelImpl instance,
) => <String, dynamic>{'url': instance.url};
