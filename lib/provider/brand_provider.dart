import 'package:ego_vision/model/api_model/product_brand_model.dart';
import 'package:flutter/material.dart';
import '../api/api_class.dart';

class BrandProvider extends ChangeNotifier {
  List<Content> provideBrandList = [];
  getBrand(context) async {
    provideBrandList = (await ApiClass.fetchBrand(context));
    notifyListeners();
  }
}
