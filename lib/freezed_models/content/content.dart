// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

Content contentFromJson(String str) => Content.fromJson(json.decode(str));

String contentToJson(Content data) => json.encode(data.toJson());

@unfreezed
class Content with _$Content {
  factory Content({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "categoryName") required String categoryName,
    @JsonKey(name: "coverPicFullName") required String coverPicFullName,
    @JsonKey(name: "viewCount") required int viewCount,
    @JsonKey(name: "favoriteCount") required int favoriteCount,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
