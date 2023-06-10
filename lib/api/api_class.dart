import 'dart:convert';
import 'package:ego_vision/constant/api_const.dart';
import 'package:ego_vision/model/api_model/product_category_model.dart' as category_model;
import 'package:ego_vision/model/api_model/product_type_model.dart' as type_model;
import 'package:ego_vision/model/api_model/product_brand_model.dart' as brand_model;
import 'package:ego_vision/model/api_model/product_color_model.dart' as color_model;
import 'package:ego_vision/model/api_model/all_product_model.dart' as all_product_model;
import 'package:http/http.dart' as http;

class ApiClass {
  //==================CategoryApi=======================
  static Future<List<category_model.Content>> fetchCategory(context) async {
    List<category_model.Content> categoryList = [];
    try {
      final response = await http.get(Uri.parse("${ApiConst.baseURL}androidApp/get_category.php"));
      category_model.Content content;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all category==========$data");
        for (var i in data["contents"]) {
          content = category_model.Content.fromJson(i);
          categoryList.add(content);
        }
      } else {
        throw Exception('Failed to load categoryList');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return categoryList;
  }

  //==================TypeApi=======================
  static Future<List<type_model.Content>> fetchType(context) async {
    List<type_model.Content> typeList = [];
    try {
      final response = await http.get(Uri.parse("${ApiConst.baseURL}androidApp/get_type.php"));
      type_model.Content content;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all types==========$data");
        for (var i in data["contents"]) {
          content = type_model.Content.fromJson(i);
          typeList.add(content);
        }
      } else {
        throw Exception('Failed to load types');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return typeList;
  }

  //==================BrandApi=======================
  static Future<List<brand_model.Content>> fetchBrand(context) async {
    List<brand_model.Content> brandList = [];
    try {
      final response = await http.get(Uri.parse("${ApiConst.baseURL}androidApp/get_brands.php"));
      brand_model.Content content;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all brand==========$data");
        for (var i in data["contents"]) {
          content = brand_model.Content.fromJson(i);
          brandList.add(content);
        }
      } else {
        throw Exception('Failed to load brands');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return brandList;
  }

  //==================ColorApi=======================
  static Future<List<color_model.Content>> fetchColor(context) async {
    List<color_model.Content> colorList = [];
    try {
      final response = await http.get(Uri.parse("${ApiConst.baseURL}androidApp/get_color.php"));
      color_model.Content content;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all color==========$data");
        for (var i in data["contents"]) {
          content = color_model.Content.fromJson(i);
          colorList.add(content);
        }
      } else {
        throw Exception('Failed to load colors');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return colorList;
  }

  //==================Product By ID Api=======================
  static Future<List<all_product_model.Content>> fetchProductById(
      context, String productKey, String productValue) async {
    List<all_product_model.Content> productListById = [];
    try {
      Map<String, dynamic> body = {};
      body = {productKey: productValue};

      final response = await http.post(
        Uri.parse("${ApiConst.baseURL}androidApp/get_produts.php"),
        body: body,
      );
      all_product_model.Content content;

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all product by id==========$data");
        for (var i in data["contents"]) {
          content = all_product_model.Content.fromJson(i);
          productListById.add(content);
        }
      } else {
        throw Exception('Failed to load All Products by id');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return productListById;
  }

  //==================All Product=======================
  static Future<List<all_product_model.Content>> fetchAllProduct(context) async {
    List<all_product_model.Content> allProductList = [];
    try {
      final response = await http.get(Uri.parse("${ApiConst.baseURL}androidApp/get_produts.php"));
      all_product_model.Content content;
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========all product==========$data");
        for (var i in data["contents"]) {
          content = all_product_model.Content.fromJson(i);
          allProductList.add(content);
        }
      } else {
        throw Exception('Failed to load all products');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return allProductList;
  }
}
