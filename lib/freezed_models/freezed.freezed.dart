// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Freezed _$FreezedFromJson(Map<String, dynamic> json) {
  return _Freezed.fromJson(json);
}

/// @nodoc
mixin _$Freezed {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryName")
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "coverPicFullName")
  String get coverPicFullName => throw _privateConstructorUsedError;
  @JsonKey(name: "viewCount")
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "favoriteCount")
  int get favoriteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezedCopyWith<Freezed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedCopyWith<$Res> {
  factory $FreezedCopyWith(Freezed value, $Res Function(Freezed) then) =
      _$FreezedCopyWithImpl<$Res, Freezed>;
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
class _$FreezedCopyWithImpl<$Res, $Val extends Freezed>
    implements $FreezedCopyWith<$Res> {
  _$FreezedCopyWithImpl(this._value, this._then);

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
abstract class _$$FreezedImplCopyWith<$Res> implements $FreezedCopyWith<$Res> {
  factory _$$FreezedImplCopyWith(
          _$FreezedImpl value, $Res Function(_$FreezedImpl) then) =
      __$$FreezedImplCopyWithImpl<$Res>;
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
class __$$FreezedImplCopyWithImpl<$Res>
    extends _$FreezedCopyWithImpl<$Res, _$FreezedImpl>
    implements _$$FreezedImplCopyWith<$Res> {
  __$$FreezedImplCopyWithImpl(
      _$FreezedImpl _value, $Res Function(_$FreezedImpl) _then)
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
    return _then(_$FreezedImpl(
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
class _$FreezedImpl implements _Freezed {
  const _$FreezedImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "categoryName") required this.categoryName,
      @JsonKey(name: "coverPicFullName") required this.coverPicFullName,
      @JsonKey(name: "viewCount") required this.viewCount,
      @JsonKey(name: "favoriteCount") required this.favoriteCount});

  factory _$FreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezedImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "categoryName")
  final String categoryName;
  @override
  @JsonKey(name: "coverPicFullName")
  final String coverPicFullName;
  @override
  @JsonKey(name: "viewCount")
  final int viewCount;
  @override
  @JsonKey(name: "favoriteCount")
  final int favoriteCount;

  @override
  String toString() {
    return 'Freezed(id: $id, name: $name, categoryName: $categoryName, coverPicFullName: $coverPicFullName, viewCount: $viewCount, favoriteCount: $favoriteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.coverPicFullName, coverPicFullName) ||
                other.coverPicFullName == coverPicFullName) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.favoriteCount, favoriteCount) ||
                other.favoriteCount == favoriteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, categoryName,
      coverPicFullName, viewCount, favoriteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedImplCopyWith<_$FreezedImpl> get copyWith =>
      __$$FreezedImplCopyWithImpl<_$FreezedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezedImplToJson(
      this,
    );
  }
}

abstract class _Freezed implements Freezed {
  const factory _Freezed(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "categoryName") required final String categoryName,
      @JsonKey(name: "coverPicFullName") required final String coverPicFullName,
      @JsonKey(name: "viewCount") required final int viewCount,
      @JsonKey(name: "favoriteCount")
      required final int favoriteCount}) = _$FreezedImpl;

  factory _Freezed.fromJson(Map<String, dynamic> json) = _$FreezedImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "categoryName")
  String get categoryName;
  @override
  @JsonKey(name: "coverPicFullName")
  String get coverPicFullName;
  @override
  @JsonKey(name: "viewCount")
  int get viewCount;
  @override
  @JsonKey(name: "favoriteCount")
  int get favoriteCount;
  @override
  @JsonKey(ignore: true)
  _$$FreezedImplCopyWith<_$FreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
