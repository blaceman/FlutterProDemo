part of models;

class UserModel {
  UserModel({
    this.phoneNum,
    this.code,
  });

  String? phoneNum;
  String? code;

  UserModel.fromJson(dynamic json) {
    phoneNum = json['phoneNum'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNum'] = phoneNum;
    map['code'] = code;

    return map;
  }
}
