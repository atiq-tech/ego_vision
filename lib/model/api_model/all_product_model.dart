// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  AllProductModel({
    this.contents,
  });

  final List<Content>? contents;

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.productSlNo,
    this.productCode,
    this.productName,
    this.ton,
    this.productCategoryId,
    this.typeId,
    this.color,
    this.brand,
    this.size,
    this.vat,
    this.productReOrederLevel,
    this.productPurchaseRate,
    this.productSellingPrice,
    this.productMinimumSellingPrice,
    this.productWholesaleRate,
    this.oneCartunEqual,
    this.isService,
    this.unitId,
    this.image,
    this.isFuture,
    this.status,
    this.addBy,
    this.addTime,
    this.updateBy,
    this.updateTime,
    this.productBranchid,
    this.productCategoryName,
    this.brandName,
    this.name,
  });

  final String? productSlNo;
  final String? productCode;
  final String? productName;
  final String? ton;
  final String? productCategoryId;
  final String? typeId;
  final String? color;
  final String? brand;
  final AddTime? size;
  final String? vat;
  final String? productReOrederLevel;
  final String? productPurchaseRate;
  final String? productSellingPrice;
  final String? productMinimumSellingPrice;
  final String? productWholesaleRate;
  final OneCartunEqual? oneCartunEqual;
  final String? isService;
  final String? unitId;
  final String? image;
  final String? isFuture;
  final Status? status;
  final AddBy? addBy;
  final dynamic addTime;
  final UpdateBy? updateBy;
  final DateTime? updateTime;
  final String? productBranchid;
  final ProductCategoryName? productCategoryName;
  final BrandName? brandName;
  final Name? name;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        productSlNo: json["Product_SlNo"],
        productCode: json["Product_Code"],
        productName: json["Product_Name"],
        ton: json["ton"],
        productCategoryId: json["ProductCategory_ID"],
        typeId: json["type_id"],
        color: json["color"],
        brand: json["brand"],
        size: addTimeValues.map[json["size"]]!,
        vat: json["vat"],
        productReOrederLevel: json["Product_ReOrederLevel"],
        productPurchaseRate: json["Product_Purchase_Rate"],
        productSellingPrice: json["Product_SellingPrice"],
        productMinimumSellingPrice: json["Product_MinimumSellingPrice"],
        productWholesaleRate: json["Product_WholesaleRate"],
        oneCartunEqual: oneCartunEqualValues.map[json["one_cartun_equal"]]!,
        isService: json["is_service"],
        unitId: json["Unit_ID"],
        image: json["image"],
        isFuture: json["is_future"],
        status: statusValues.map[json["status"]]!,
        addBy: addByValues.map[json["AddBy"]]!,
        addTime: json["AddTime"],
        updateBy: updateByValues.map[json["UpdateBy"]]!,
        updateTime: json["UpdateTime"] == null ? null : DateTime.parse(json["UpdateTime"]),
        productBranchid: json["Product_branchid"],
        productCategoryName: productCategoryNameValues.map[json["ProductCategory_Name"]]!,
        brandName: brandNameValues.map[json["brand_name"]]!,
        name: nameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Product_SlNo": productSlNo,
        "Product_Code": productCode,
        "Product_Name": productName,
        "ton": ton,
        "ProductCategory_ID": productCategoryId,
        "type_id": typeId,
        "color": color,
        "brand": brand,
        "size": addTimeValues.reverse[size],
        "vat": vat,
        "Product_ReOrederLevel": productReOrederLevel,
        "Product_Purchase_Rate": productPurchaseRate,
        "Product_SellingPrice": productSellingPrice,
        "Product_MinimumSellingPrice": productMinimumSellingPrice,
        "Product_WholesaleRate": productWholesaleRate,
        "one_cartun_equal": oneCartunEqualValues.reverse[oneCartunEqual],
        "is_service": isService,
        "Unit_ID": unitId,
        "image": image,
        "is_future": isFuture,
        "status": statusValues.reverse[status],
        "AddBy": addByValues.reverse[addBy],
        "AddTime": addTime,
        "UpdateBy": updateByValues.reverse[updateBy],
        "UpdateTime": updateTime?.toIso8601String(),
        "Product_branchid": productBranchid,
        "ProductCategory_Name": productCategoryNameValues.reverse[productCategoryName],
        "brand_name": brandNameValues.reverse[brandName],
        "name": nameValues.reverse[name],
      };
}

enum AddBy { NULL, ADMIN }

final addByValues = EnumValues({"Admin": AddBy.ADMIN, "Null": AddBy.NULL});

enum AddTime { NULL, NA }

final addTimeValues = EnumValues({"na": AddTime.NA, "Null": AddTime.NULL});

enum BrandName { EGO, EGO_LITE, EGO_FOREST, BIONIX }

final brandNameValues = EnumValues({
  "Bionix": BrandName.BIONIX,
  "Ego": BrandName.EGO,
  "Ego Forest": BrandName.EGO_FOREST,
  "Ego Lite": BrandName.EGO_LITE
});

enum Name { CONTACT_LENS, ACCESSORIES }

final nameValues = EnumValues({"Accessories": Name.ACCESSORIES, "Contact Lens": Name.CONTACT_LENS});

enum OneCartunEqual { NULL, EMPTY }

final oneCartunEqualValues = EnumValues({"": OneCartunEqual.EMPTY, "Null": OneCartunEqual.NULL});

enum ProductCategoryName { COLOR_WITH_POWER, COSMETIC, CLEAR_POWER, MEDICAL, SAMPLE, BAG, LENS_CASE }

final productCategoryNameValues = EnumValues({
  "Bag": ProductCategoryName.BAG,
  "Clear Power": ProductCategoryName.CLEAR_POWER,
  "Color With Power": ProductCategoryName.COLOR_WITH_POWER,
  "Cosmetic": ProductCategoryName.COSMETIC,
  "Lens Case": ProductCategoryName.LENS_CASE,
  "Medical": ProductCategoryName.MEDICAL,
  "Sample": ProductCategoryName.SAMPLE
});

enum Status { A }

final statusValues = EnumValues({"a": Status.A});

enum UpdateBy { ADMIN, BISHOP_MISTRY }

final updateByValues = EnumValues({"Admin": UpdateBy.ADMIN, "Bishop Mistry": UpdateBy.BISHOP_MISTRY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
