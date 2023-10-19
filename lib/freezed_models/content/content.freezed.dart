// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  set name(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryName")
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryName")
  set categoryName(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "coverPicFullName")
  String get coverPicFullName => throw _privateConstructorUsedError;
  @JsonKey(name: "coverPicFullName")
  set coverPicFullName(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "viewCount")
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "viewCount")
  set viewCount(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "favoriteCount")
  int get favoriteCount => throw _privateConstructorUsedError;
  @JsonKey(name: "favoriteCount")
  set favoriteCount(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "categoryName") String categoryName,
      @JsonKey(name: "coverPicFullName") String coverPicFullName,
      @JsonKey(name: "viewCount") int viewCount,
      @JsonKey(name: "favoriteCount") int favoriteCount});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? coverPicFullName = null,
    Object? viewCount = null,
    Object? favoriteCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      coverPicFullName: null == coverPicFullName
          ? _value.coverPicFullName
          : coverPicFullName // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteCount: null == favoriteCount
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "categoryName") String categoryName,
      @JsonKey(name: "coverPicFullName") String coverPicFullName,
      @JsonKey(name: "viewCount") int viewCount,
      @JsonKey(name: "favoriteCount") int favoriteCount});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? coverPicFullName = null,
    Object? viewCount = null,
    Object? favoriteCount = null,
  }) {
    return _then(_$ContentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      coverPicFullName: null == coverPicFullName
          ? _value.coverPicFullName
          : coverPicFullName // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteCount: null == favoriteCount
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  _$ContentImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "categoryName") required this.categoryName,
      @JsonKey(name: "coverPicFullName") required this.coverPicFullName,
      @JsonKey(name: "viewCount") required this.viewCount,
      @JsonKey(name: "favoriteCount") required this.favoriteCount});

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  @override
  @JsonKey(name: "id")
  int id;
  @override
  @JsonKey(name: "name")
  String name;
  @override
  @JsonKey(name: "categoryName")
  String categoryName;
  @override
  @JsonKey(name: "coverPicFullName")
  String coverPicFullName;
  @override
  @JsonKey(name: "viewCount")
  int viewCount;
  @override
  @JsonKey(name: "favoriteCount")
  int favoriteCount;

  @override
  String toString() {
    return 'Content(id: $id, name: $name, categoryName: $categoryName, coverPicFullName: $coverPicFullName, viewCount: $viewCount, favoriteCount: $favoriteCount)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  factory _Content(
          {@JsonKey(name: "id") required int id,
          @JsonKey(name: "name") required String name,
          @JsonKey(name: "categoryName") required String categoryName,
          @JsonKey(name: "coverPicFullName") required String coverPicFullName,
          @JsonKey(name: "viewCount") required int viewCount,
          @JsonKey(name: "favoriteCount") required int favoriteCount}) =
      _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @JsonKey(name: "id")
  set id(int value);
  @override
  @JsonKey(name: "name")
  String get name;
  @JsonKey(name: "name")
  set name(String value);
  @override
  @JsonKey(name: "categoryName")
  String get categoryName;
  @JsonKey(name: "categoryName")
  set categoryName(String value);
  @override
  @JsonKey(name: "coverPicFullName")
  String get coverPicFullName;
  @JsonKey(name: "coverPicFullName")
  set coverPicFullName(String value);
  @override
  @JsonKey(name: "viewCount")
  int get viewCount;
  @JsonKey(name: "viewCount")
  set viewCount(int value);
  @override
  @JsonKey(name: "favoriteCount")
  int get favoriteCount;
  @JsonKey(name: "favoriteCount")
  set favoriteCount(int value);
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
