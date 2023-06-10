// To parse this JSON data, do
//
//     final productTypeModel = productTypeModelFromJson(jsonString);

import 'dart:convert';

ProductTypeModel productTypeModelFromJson(String str) => ProductTypeModel.fromJson(json.decode(str));

String productTypeModelToJson(ProductTypeModel data) => json.encode(data.toJson());

class ProductTypeModel {
  ProductTypeModel({
    this.contents,
  });

  final List<Content>? contents;

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) => ProductTypeModel(
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.id,
    this.name,
    this.status,
  });

  final String? id;
  final String? name;
  final String? status;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
