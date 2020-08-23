import 'dart:convert';

import 'dart:ui';

import 'product_type_model.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.code,
    this.image,
    this.title,
    this.description,
    this.price,
    this.size,
    this.color,
    this.productTypeId,
    this.productType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String id, code, image, title, description, size, productTypeId;
  final int price;
  final Color color;
  final ProductType productType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  ProductModel copyWith({
    String id,
    code,
    image,
    title,
    description,
    size,
    productTypeId,
    int price,
    Color color,
    ProductType productType,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime deletedAt,
  }) =>
      ProductModel(
        id: id ?? this.id,
        code: code ?? this.code,
        image: image ?? this.image,
        title: title ?? this.title,
        price: price ?? this.price,
        size: size ?? this.size,
        color: color ?? this.color,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        image: json["image"] == null ? null : json["image"],
        title: json["ein_ssa"] == null ? null : json["ein_ssa"],
        price: json["price"] == null ? null : json["price"],
        size: json["size"] == null ? null : json["size"],
        color: json["color"] == null ? null : json["color"],
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
        "image": image == null ? null : image,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "size": size == null ? null : size,
        "color": color == null ? null : color,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
      };

  static List<ProductModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<ProductModel>((item) => ProductModel.fromMap(item))
        .toList();
  }
}

class ProductType {
  ProductType({
    this.id,
    this.code,
    this.description,
  });

  final String id;
  final String code;
  final String description;

  ProductType copyWith({
    String id,
    String code,
    String description,
  }) =>
      ProductType(
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
      );

  factory ProductType.fromJson(String str) =>
      ProductType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductType.fromMap(Map<String, dynamic> json) => ProductType(
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
