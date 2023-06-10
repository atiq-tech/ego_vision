import 'package:ego_vision/api/api_class.dart';
import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/pages/product_details_page.dart';
import 'package:ego_vision/widgets/bottom_navigation_bar.dart';
import 'package:ego_vision/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../constant/api_const.dart';
import '../../model/api_model/all_product_model.dart';
import '../../widgets/shimmer/shimmer_grid.dart';
import '../model/hive/product.dart';
import '../provider/hive_provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.productKey, required this.productValue}) : super(key: key);
  String? productKey;
  String? productValue;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final Box box;
  late Future<List<Content>> _dataFuture;

  @override
  void initState() {
    setState(() {});
    super.initState();
    _dataFuture = ApiClass.fetchProductById(context, "${widget.productKey}", "${widget.productValue}");
    // Provider.of<HiveProvider>(context, listen: false).getCounter(context);
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  double productTextSize = 14.0;
  double productPriceSize = 14.0;

  @override
  Widget build(BuildContext context) {
    final hiveList = Provider.of<HiveProvider>(context);
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: AppColor.primary,
        title: const Text('Products'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
            child: ShoppingCartBadge(),
          )
        ],
      ),

      body: FutureBuilder(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            List<Content> allProducts = snapshot.data ?? [];
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: GridView.builder(
                itemCount: allProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 4 : 2,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  final item = allProducts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return ProductDetailsPage(
                          pName: item.productName,
                          pImage: "${ApiConst.imageURL}${item.image}",
                          pQuantity: 1,
                          pPrice: double.parse(item.productSellingPrice.toString()),
                        );
                      })).then((_) => setState(() {}));
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 80, child: Image.network("${ApiConst.imageURL}${item.image}")),
                            Text("${item.productName}"),
                            Text(
                              '৳ ' + item.productSellingPrice.toString(),
                              style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                              height: 25,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  onPressed: () {
                                    bool found = false;
                                    setState(() {
                                      box.length;
                                    });
                                    for (int i = 0; i < box.length; i++) {
                                      ProductDetails existingProduct = box.getAt(i);
                                      if (existingProduct.productName == item.productName &&
                                          existingProduct.productPrice == double.parse(item.productSellingPrice!)) {
                                        existingProduct.productQuantity = 1;
                                        box.putAt(i, existingProduct);
                                        found = true;
                                        break;
                                      }
                                    }
                                    if (!found) {
                                      ProductDetails productDetails = ProductDetails(
                                        productImage: "${ApiConst.imageURL}${item.image}",
                                        productName: item.productName!,
                                        productPrice: double.parse(item.productSellingPrice!),
                                        productQuantity: 1,
                                      );
                                      box.add(productDetails);
                                      hiveList.hiveCounter(box.length);
                                    }
                                  },
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(fontSize: 9),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(child: ShimmerGrid());
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
