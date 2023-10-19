// To parse this JSON data, do
//
//     final freezed = freezedFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed.freezed.dart';
part 'freezed.g.dart';

Freezed freezedFromJson(String str) => Freezed.fromJson(json.decode(str));

String freezedToJson(Freezed data) => json.encode(data.toJson());

@freezed
class Freezed with _$Freezed {
  const factory Freezed({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "categoryName") required String categoryName,
    @JsonKey(name: "coverPicFullName") required String coverPicFullName,
    @JsonKey(name: "viewCount") required int viewCount,
    @JsonKey(name: "favoriteCount") required int favoriteCount,
  }) = _Freezed;

  factory Freezed.fromJson(Map<String, dynamic> json) =>
      _$FreezedFromJson(json);
}
