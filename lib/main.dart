import 'package:ego_vision/pages/signup_login/login_page.dart';
import 'package:ego_vision/provider/all_product_provider.dart';
import 'package:ego_vision/provider/brand_provider.dart';
import 'package:ego_vision/provider/category_provider.dart';
import 'package:ego_vision/provider/color_provider.dart';
import 'package:ego_vision/provider/hive_provider.dart';
import 'package:ego_vision/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'model/hive/product.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(ProductDetailsAdapter());
  // Opening the box
  await Hive.openBox('productBox');
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()),
        ChangeNotifierProvider<TypeProvider>(create: (context) => TypeProvider()),
        ChangeNotifierProvider<BrandProvider>(create: (context) => BrandProvider()),
        ChangeNotifierProvider<ColorProvider>(create: (context) => ColorProvider()),
        ChangeNotifierProvider<AllProductProvider>(create: (context) => AllProductProvider()),
        ChangeNotifierProvider<HiveProvider>(create: (context) => HiveProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ego Vision',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LoginPage()),
      // ego vision
    );
  }
}
