import 'package:ego_vision/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../model/hive/product.dart';
import '../provider/hive_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Box box;
  double h1TextSize = 11.0;
  double totalPrice = 0;
  double shippingFee = 60;
  double h2TextSize = 14.0;
  ScrollController _listView1Controller = ScrollController();
  ScrollController _listView2Controller = ScrollController();

  @override
  void initState() {
    box = Hive.box('productBox');

    // TODO: implement initState
    super.initState();
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    final hiveList = Provider.of<HiveProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: AppColor.primary,
        title: Text('Cart Info'),
        actions: [],
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('No Product in Cart'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _listView1Controller,
                    itemCount: box.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var currentBox = box;
                      var productData = currentBox.getAt(index)!;
                      return Column(
                        children: [
                          SizedBox(
                            height: 90,
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(),
                                      child: Image.network(
                                        productData.productImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[100],
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${productData.productName}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: h1TextSize,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "৳",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                              Text(
                                                "${productData.productPrice}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "x ${productData.productQuantity}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "= ৳",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                              Text(
                                                "${productData.productPrice * productData.productQuantity}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: FloatingActionButton(
                                                  heroTag: null,
                                                  onPressed: () {
                                                    setState(() {
                                                      if (productData.productQuantity > 1) {
                                                        productData.productQuantity--;
                                                        ProductDetails existingProduct = box.getAt(index);

                                                        existingProduct.productQuantity = productData.productQuantity--;

                                                        box.putAt(index, existingProduct);
                                                      }
                                                    });
                                                  },
                                                  mini: true,
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  shape: const CircleBorder(),
                                                  backgroundColor: Colors.black12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${productData.productQuantity}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: FloatingActionButton(
                                                  heroTag: null,
                                                  onPressed: () {
                                                    setState(() {
                                                      productData.productQuantity++;
                                                      ProductDetails existingProduct = box.getAt(index);
                                                      existingProduct.productQuantity = productData.productQuantity++;
                                                      box.putAt(index, existingProduct);
                                                    });
                                                  },
                                                  mini: true,
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  shape: const CircleBorder(),
                                                  backgroundColor: Colors.black12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.white,
                                        child: FloatingActionButton(
                                          heroTag: null,
                                          onPressed: () {
                                            _deleteProduct(index);
                                            setState(() {
                                              hiveList.hiveCounter(box.length);
                                            });
                                          },
                                          mini: true,
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(255, 231, 113, 139),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: 140,
                  // color: Colors.grey.withOpacity(0.5),
                  child: ListView.builder(
                    controller: _listView2Controller,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      num totalPrice = 0;
                      for (int i = 0; i < box.length; i++) {
                        var productData = box.getAt(i)!;
                        totalPrice += productData.productPrice * productData.productQuantity;
                      }

                      return Container(
                        padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal: ",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38),
                                ),
                                Text(
                                  "৳$totalPrice",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38),
                                )
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                "Shipping cost:",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38),
                              ),
                              Text(
                                "৳ $shippingFee",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38),
                                ),
                                Text(
                                  "৳${(totalPrice + shippingFee).toString()}",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 60, 84, 97),
                                minimumSize: const Size.fromHeight(45),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => CheckoutScreen(
                                //         checkoutFrom: "cart_page",
                                //         productName: "T-Shirt",
                                //         productQuantity: 10,
                                //         productSubtotalPrice: 100,
                                //         productTotalPrice: 150,
                                //         productUnitPrice: 150,
                                //       ),
                                //     ));
                              },
                              child: const Text("Checkout"),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  int count = 0;
}
