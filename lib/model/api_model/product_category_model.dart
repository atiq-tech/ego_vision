// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromJson(jsonString);

import 'dart:convert';

ProductCategoryModel productCategoryModelFromJson(String str) => ProductCategoryModel.fromJson(json.decode(str));

String productCategoryModelToJson(ProductCategoryModel data) => json.encode(data.toJson());

class ProductCategoryModel {
  ProductCategoryModel({
    this.contents,
  });

  final List<Content>? contents;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.productCategorySlNo,
    this.productCategoryName,
  });

  final String? productCategorySlNo;
  final String? productCategoryName;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        productCategorySlNo: json["ProductCategory_SlNo"],
        productCategoryName: json["ProductCategory_Name"],
      );

  Map<String, dynamic> toJson() => {
        "ProductCategory_SlNo": productCategorySlNo,
        "ProductCategory_Name": productCategoryName,
      };
}
