import 'package:ego_vision/model/api_model/product_type_model.dart';
import 'package:flutter/material.dart';
import '../api/api_class.dart';

class TypeProvider extends ChangeNotifier {
  List<Content> provideTypeList = [];
  getType(context) async {
    provideTypeList = (await ApiClass.fetchType(context));
    notifyListeners();
  }
}
