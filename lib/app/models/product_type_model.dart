// To parse this JSON data, do
//
//     final unitsMeasureModel = unitsMeasureModelFromMap(jsonString);

import 'dart:convert';

class ProductTypeModel {
  ProductTypeModel({
    this.id,
    this.code,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String code;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  ProductTypeModel copyWith({
    String id,
    String code,
    String description,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime deletedAt,
  }) =>
      ProductTypeModel(
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ProductTypeModel.fromJson(String str) =>
      ProductTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductTypeModel.fromMap(Map<String, dynamic> json) =>
      ProductTypeModel(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
      };

  static List<ProductTypeModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<ProductTypeModel>((item) => ProductTypeModel.fromMap(item))
        .toList();
  }
}
