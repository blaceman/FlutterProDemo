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

/**步骤：
 *1.https://app.quicktype.io/去生成dart的model代码，勾选@freezed 以及json_serializable
 *2.新建文件把生成代码复制进去
 *3.运行:dart run build_runner build
 */
/**功能
 *1.@freezed 注解替换为 @unfreezed ：定义不可变的类或者一个可变的类
 *2.@Freezed(makeCollectionsUnmodifiable: false)：允许对 List/Map/Set 进行修改
 *3.生成copyWith方法。这允许您轻松创建当前对象的深浅拷贝,并在必要时更改某些属性。
 *4.生成==/hashCode方法。这使您的类变成可哈希和可比较的,可以使用在Set和Map中，在不可变类。
 *5.生成toJson和fromJson方法。这使您的类可以轻松与JSON序列化和反序列化。
 */

//例子：
  // var cont = Content(
  //       id: 111,
  //       name: '',
  //       categoryName: '',
  //       coverPicFullName: '',
  //       viewCount: 2,
  //       favoriteCount: 3);
  //   cont.name = '222';//定义@unfreezed为可变使得name能改变
  //   var cont2 = cont.copyWith(name: '333');//copyWith方法
  //   print(cont == cont2); // 不可变有hashCode方法，可变则没有hashCode方法
  //   var cont3 = Content.fromJson({});//序列化
  //   cont3.toJson();//反序列化