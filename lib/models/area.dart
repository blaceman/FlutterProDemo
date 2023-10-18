part of models;

class AreaModel {
  AreaModel({
    this.value,
    this.label,
    this.children,
  });

  AreaModel.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(AreaModel.fromJson(v));
      });
    }
  }

  int? value;
  String? label;
  List<AreaModel>? children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
