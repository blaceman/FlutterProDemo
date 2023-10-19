// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedImpl _$$FreezedImplFromJson(Map<String, dynamic> json) =>
    _$FreezedImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      categoryName: json['categoryName'] as String,
      coverPicFullName: json['coverPicFullName'] as String,
      viewCount: json['viewCount'] as int,
      favoriteCount: json['favoriteCount'] as int,
    );

Map<String, dynamic> _$$FreezedImplToJson(_$FreezedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryName': instance.categoryName,
      'coverPicFullName': instance.coverPicFullName,
      'viewCount': instance.viewCount,
      'favoriteCount': instance.favoriteCount,
    };
