// To parse this JSON data, do
//
//     final productBrandModel = productBrandModelFromJson(jsonString);

import 'dart:convert';

ProductBrandModel productBrandModelFromJson(String str) => ProductBrandModel.fromJson(json.decode(str));

String productBrandModelToJson(ProductBrandModel data) => json.encode(data.toJson());

class ProductBrandModel {
  ProductBrandModel({
    this.contents,
  });

  final List<Content>? contents;

  factory ProductBrandModel.fromJson(Map<String, dynamic> json) => ProductBrandModel(
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.brandSiNo,
    this.productCategorySlNo,
    this.brandName,
    this.status,
    this.brandBranchid,
  });

  final String? brandSiNo;
  final String? productCategorySlNo;
  final String? brandName;
  final String? status;
  final String? brandBranchid;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        brandSiNo: json["brand_SiNo"],
        productCategorySlNo: json["ProductCategory_SlNo"],
        brandName: json["brand_name"],
        status: json["status"],
        brandBranchid: json["brand_branchid"],
      );

  Map<String, dynamic> toJson() => {
        "brand_SiNo": brandSiNo,
        "ProductCategory_SlNo": productCategorySlNo,
        "brand_name": brandName,
        "status": status,
        "brand_branchid": brandBranchid,
      };
}
