import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/provider/hive_provider.dart';
import 'package:ego_vision/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../model/hive/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final String? pName, pImage;
  final double? pPrice;
  int pQuantity;
  ProductDetailsPage({
    super.key,
    this.pPrice,
    required this.pName,
    required this.pImage,
    required this.pQuantity,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int categoryId = 1;
  int selectedSizeButton = 1;
  double headingTextSize = 20.0;
  double descriptionTextSize = 18.0;
  String productDetailsText = "This is the details of the products.";
  ScrollController _listViewController = ScrollController();
  ScrollController _singleChildScrollViewController = ScrollController();

  late final Box box;

  @override
  void initState() {
    super.initState();
    print("pName===${widget.pName}");
    print("pImage===${widget.pImage}");
    print("pPrice===${widget.pPrice}");
    print("pQuantity===${widget.pQuantity}");
    box = Hive.box('productBox');
  }

  @override
  Widget build(BuildContext context) {
    final hiveList = Provider.of<HiveProvider>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          toolbarHeight: 45,
          title: const Text('Product Details'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
              child: ShoppingCartBadge(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: _singleChildScrollViewController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  child: Image.network(
                    widget.pImage!,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    height: 90,
                    margin: EdgeInsets.only(top: 8),
                    width: double.infinity,
                    child: ListView.builder(
                      controller: _listViewController,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 80,
                            width: 80,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                            child: Image.network(
                              widget.pImage!,
                              fit: BoxFit.fill,
                            ));
                      },
                    )),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.pName!,
                                  style: TextStyle(fontSize: headingTextSize, fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff309ade),
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(Icons.remove),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              widget.pQuantity > 1 ? widget.pQuantity-- : widget.pQuantity;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        widget.pQuantity.toString(),
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 30,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff309ade)),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              widget.pQuantity > 0 ? widget.pQuantity++ : widget.pQuantity;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Price: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: descriptionTextSize,
                              ),
                            ),
                            Text(
                              "৳${widget.pPrice.toString()}",
                              style: TextStyle(
                                fontSize: descriptionTextSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CheckoutScreen(
                  //         checkoutFrom: "productDetails",
                  //         productName: widget.pName,
                  //         productQuantity: widget.pQuantity,
                  //         productSubtotalPrice: widget.pPrice! * widget.pQuantity,
                  //         productUnitPrice: widget.pPrice,
                  //         productTotalPrice: widget.pPrice! * widget.pQuantity,
                  //       ),
                  //     ));
                  //====================================
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CheckoutScreen(
                  //         productName: productData.productName,
                  //         productQuantity: productData.productQuantity,
                  //         productSubtotalPrice: productData.productPrice *
                  //             productData.productQuantity,
                  //         productUnitPrice: productData.productPrice,
                  //         productTotalPrice: totalPrice.toInt(),
                  //       ),
                  //     ));
                },
                child: Text("Check Out")),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  bool found = false;
                  setState(() {
                    hiveList.hiveCounter(box.length);
                  });
                  for (int i = 0; i < box.length; i++) {
                    ProductDetails existingProduct = box.getAt(i);
                    if (existingProduct.productName == widget.pName && existingProduct.productPrice == widget.pPrice) {
                      existingProduct.productQuantity = widget.pQuantity;
                      box.putAt(i, existingProduct);
                      found = true;
                      break;
                    }
                  }
                  if (!found) {
                    ProductDetails productDetails = ProductDetails(
                      productImage: widget.pImage!,
                      productName: widget.pName!,
                      productPrice: widget.pPrice!,
                      productQuantity: widget.pQuantity,
                    );
                    box.add(productDetails);
                  }
                },
                child: Text("Add to Cart"))
          ],
        ));
  }
}
