// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      categoryName: json['categoryName'] as String,
      coverPicFullName: json['coverPicFullName'] as String,
      viewCount: json['viewCount'] as int,
      favoriteCount: json['favoriteCount'] as int,
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryName': instance.categoryName,
      'coverPicFullName': instance.coverPicFullName,
      'viewCount': instance.viewCount,
      'favoriteCount': instance.favoriteCount,
    };
