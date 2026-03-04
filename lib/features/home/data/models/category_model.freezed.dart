// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  CategoryImageModel get image => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
    CategoryModel value,
    $Res Function(CategoryModel) then,
  ) = _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String title,
    int rank,
    CategoryImageModel image,
  });

  $CategoryImageModelCopyWith<$Res> get image;
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? rank = null,
    Object? image = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as CategoryImageModel,
          )
          as $Val,
    );
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryImageModelCopyWith<$Res> get image {
    return $CategoryImageModelCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
    _$CategoryModelImpl value,
    $Res Function(_$CategoryModelImpl) then,
  ) = __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String title,
    int rank,
    CategoryImageModel image,
  });

  @override
  $CategoryImageModelCopyWith<$Res> get image;
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
    _$CategoryModelImpl _value,
    $Res Function(_$CategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? rank = null,
    Object? image = null,
  }) {
    return _then(
      _$CategoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as CategoryImageModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl({
    required this.id,
    required this.name,
    required this.title,
    required this.rank,
    required this.image,
  });

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String title;
  @override
  final int rank;
  @override
  final CategoryImageModel image;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, title: $title, rank: $rank, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, title, rank, image);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel({
    required final int id,
    required final String name,
    required final String title,
    required final int rank,
    required final CategoryImageModel image,
  }) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get title;
  @override
  int get rank;
  @override
  CategoryImageModel get image;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryImageModel _$CategoryImageModelFromJson(Map<String, dynamic> json) {
  return _CategoryImageModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryImageModel {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this CategoryImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryImageModelCopyWith<CategoryImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryImageModelCopyWith<$Res> {
  factory $CategoryImageModelCopyWith(
    CategoryImageModel value,
    $Res Function(CategoryImageModel) then,
  ) = _$CategoryImageModelCopyWithImpl<$Res, CategoryImageModel>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$CategoryImageModelCopyWithImpl<$Res, $Val extends CategoryImageModel>
    implements $CategoryImageModelCopyWith<$Res> {
  _$CategoryImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryImageModelImplCopyWith<$Res>
    implements $CategoryImageModelCopyWith<$Res> {
  factory _$$CategoryImageModelImplCopyWith(
    _$CategoryImageModelImpl value,
    $Res Function(_$CategoryImageModelImpl) then,
  ) = __$$CategoryImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$CategoryImageModelImplCopyWithImpl<$Res>
    extends _$CategoryImageModelCopyWithImpl<$Res, _$CategoryImageModelImpl>
    implements _$$CategoryImageModelImplCopyWith<$Res> {
  __$$CategoryImageModelImplCopyWithImpl(
    _$CategoryImageModelImpl _value,
    $Res Function(_$CategoryImageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _$CategoryImageModelImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImageModelImpl implements _CategoryImageModel {
  const _$CategoryImageModelImpl({required this.url});

  factory _$CategoryImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImageModelImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'CategoryImageModel(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImageModelImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of CategoryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImageModelImplCopyWith<_$CategoryImageModelImpl> get copyWith =>
      __$$CategoryImageModelImplCopyWithImpl<_$CategoryImageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImageModelImplToJson(this);
  }
}

abstract class _CategoryImageModel implements CategoryImageModel {
  const factory _CategoryImageModel({required final String url}) =
      _$CategoryImageModelImpl;

  factory _CategoryImageModel.fromJson(Map<String, dynamic> json) =
      _$CategoryImageModelImpl.fromJson;

  @override
  String get url;

  /// Create a copy of CategoryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImageModelImplCopyWith<_$CategoryImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
