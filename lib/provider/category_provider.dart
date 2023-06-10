import 'package:ego_vision/model/api_model/product_category_model.dart';
import 'package:flutter/material.dart';
import '../api/api_class.dart';

class CategoryProvider extends ChangeNotifier {
  List<Content> provideCategoryList = [];
  getCategory(context) async {
    provideCategoryList = (await ApiClass.fetchCategory(context));
    notifyListeners();
  }
}
