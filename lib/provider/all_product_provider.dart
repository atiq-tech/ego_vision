import 'package:ego_vision/model/api_model/all_product_model.dart';
import 'package:flutter/material.dart';
import '../api/api_class.dart';

class AllProductProvider extends ChangeNotifier {
  List<Content> provideAllProductList = [];

  getAllProduct(BuildContext context) async {
    provideAllProductList = await ApiClass.fetchAllProduct(context);
    notifyListeners();
  }
}
