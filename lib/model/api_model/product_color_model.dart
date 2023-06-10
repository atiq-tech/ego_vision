// To parse this JSON data, do
//
//     final productColorModel = productColorModelFromJson(jsonString);

import 'dart:convert';

ProductColorModel productColorModelFromJson(String str) => ProductColorModel.fromJson(json.decode(str));

String productColorModelToJson(ProductColorModel data) => json.encode(data.toJson());

class ProductColorModel {
  ProductColorModel({
    this.contents,
  });

  final List<Content>? contents;

  factory ProductColorModel.fromJson(Map<String, dynamic> json) => ProductColorModel(
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.colorSiNo,
    this.colorName,
    this.description,
    this.status,
  });

  final String? colorSiNo;
  final String? colorName;
  final Description? description;
  final Status? status;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        colorSiNo: json["color_SiNo"],
        colorName: json["color_name"],
        description: descriptionValues.map[json["description"]]!,
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toJson() => {
        "color_SiNo": colorSiNo,
        "color_name": colorName,
        "description": descriptionValues.reverse[description],
        "status": statusValues.reverse[status],
      };
}

enum Description { EGO_FOREST, EGO, BIONIX, EMPTY, EGO_LITE }

final descriptionValues = EnumValues({
  "Bionix": Description.BIONIX,
  "Ego": Description.EGO,
  "Ego Forest": Description.EGO_FOREST,
  "Ego Lite": Description.EGO_LITE,
  "": Description.EMPTY
});

enum Status { A }

final statusValues = EnumValues({"a": Status.A});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
