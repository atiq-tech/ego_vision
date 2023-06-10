import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/pages/product_details_page.dart';
import 'package:ego_vision/provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/api_const.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AllProductProvider>(context, listen: false).getAllProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allProductList = Provider.of<AllProductProvider>(context).provideAllProductList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Product"),
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: allProductList.length,
          itemBuilder: (context, index) {
            final item = allProductList[index];
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
                elevation: 3,
                child: ListTile(
                  leading: Container(
                      height: 30,
                      width: 30,
                      child: Image.network("${ApiConst.imageURL}${allProductList[index].image}")),
                  title: Text("${allProductList[index].productName}"),
                  subtitle: Text(
                    "৳ ${allProductList[index].productSellingPrice}",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
