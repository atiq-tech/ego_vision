import 'package:ego_vision/model/api_model/product_color_model.dart';
import 'package:flutter/material.dart';
import '../api/api_class.dart';

class ColorProvider extends ChangeNotifier {
  List<Content> provideColorList = [];
  getColor(context) async {
    provideColorList = (await ApiClass.fetchColor(context));
    notifyListeners();
  }
}
