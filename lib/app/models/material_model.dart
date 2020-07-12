// To parse this JSON data, do
//
//     final materialModel = materialModelFromMap(jsonString);

import 'dart:convert';

class MaterialModel {
    MaterialModel({
        this.id,
        this.code,
        this.description,
        this.materialUnitId,
        this.materialUnit,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    final String id;
    final String code;
    final String description;
    final String materialUnitId;
    final MaterialUnit materialUnit;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime deletedAt;

    MaterialModel copyWith({
        String id,
        String code,
        String description,
        String materialUnitId,
        MaterialUnit materialUnit,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
    }) => 
        MaterialModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            materialUnitId: materialUnitId ?? this.materialUnitId,
            materialUnit: materialUnit ?? this.materialUnit,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory MaterialModel.fromJson(String str) => MaterialModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialModel.fromMap(Map<String, dynamic> json) => MaterialModel(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
        materialUnitId: json["material_unit_id"] == null ? null : json["material_unit_id"],
        materialUnit: json["material_unit"] == null ? null : MaterialUnit.fromMap(json["material_unit"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
        "material_unit_id": materialUnitId == null ? null : materialUnitId,
        "material_unit": materialUnit == null ? null : materialUnit.toMap(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
    };
}

class MaterialUnit {
    MaterialUnit({
        this.id,
        this.code,
        this.description,
    });

    final String id;
    final String code;
    final String description;

    MaterialUnit copyWith({
        String id,
        String code,
        String description,
    }) => 
        MaterialUnit(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
        );

    factory MaterialUnit.fromJson(String str) => MaterialUnit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialUnit.fromMap(Map<String, dynamic> json) => MaterialUnit(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
    };
}
