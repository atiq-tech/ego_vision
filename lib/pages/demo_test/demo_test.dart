// import 'package:ego_vision/constant/api_const.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../constant/app_color.dart';
// import '../provider/all_product_provider.dart';
// import '../widgets/bottom_navigation_bar.dart';
// import '../widgets/drawer.dart';
// import '../widgets/shoping_cart_badge.dart';
//
// class ProductPage extends StatefulWidget {
//   ProductPage({Key? key, required this.productKey, required this.productValue}) : super(key: key);
//   String? productKey;
//   String? productValue;
//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }
//
// class _ProductPageState extends State<ProductPage> {
//   ScrollController _gridViewController = ScrollController();
//
//   @override
//   void initState() {
//     Provider.of<AllProductProvider>(context, listen: false)
//         .getAllProduct(context, "${widget.productKey}", "${widget.productValue}");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final allProductList = Provider.of<AllProductProvider>(context).provideAllProductList;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFEEEEEE),
//       appBar: AppBar(
//         toolbarHeight: 45,
//         backgroundColor: AppColor.primary,
//         title: Text("Products"),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
//             child: ShoppingCartBadge(),
//           )
//         ],
//       ),
//       drawer: MyCustomDrawer(),
//       body: Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         child: allProductList.isEmpty
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : GridView.builder(
//                 controller: _gridViewController,
//                 itemCount: allProductList.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 10,
//                     crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 4 : 2,
//                     mainAxisExtent: 200),
//                 itemBuilder: (context, index) {
//                   final item = allProductList[index];
//                   return InkWell(
//                     // onTap: () {
//                     //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//                     //     return ProductDetailsPage(
//                     //       // categoryName: categoryItem[index]["catItemName"],
//                     //       pName: users[index]["pName"],
//                     //       pImage: users[index]["pImage"],
//                     //       pQuantity: users[index]["pQuantity"],
//                     //       pPrice: users[index]["pPrice"],
//                     //     );
//                     //   })).then((_) => setState(() {}));
//                     // },
//                     child: Card(
//                       elevation: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // SizedBox(height: 80, child: Image.asset(item["pImage"])),
//                             SizedBox(height: 80, child: Image.network("${ApiConst.imageURL}${item.image}")),
//                             Text("${item.productName}"),
//                             Text(
//                               r'$' + item.productSellingPrice.toString(),
//                               style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               width: 80,
//                               height: 25,
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                                   onPressed: () {
//                                     // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//                                     //   return ProductDetailsPage(
//                                     //     // categoryName: categoryItem[index]["catItemName"],
//                                     //     pName: users[index]["pName"],
//                                     //     pImage: users[index]["pImage"],
//                                     //     pQuantity: users[index]["pQuantity"],
//                                     //     pPrice: users[index]["pPrice"],
//                                     //   );
//                                     // })).then((_) => setState(() {}));
//                                   },
//                                   child: const Text(
//                                     "Add to Cart",
//                                     style: TextStyle(fontSize: 9),
//                                   )),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(),
//     );
//   }
// }
