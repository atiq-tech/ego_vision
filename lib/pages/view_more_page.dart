// import 'package:ego_vision/constant/app_color.dart';
// import 'package:ego_vision/model/dummy/product_list.dart';
// import 'package:ego_vision/page_switcher.dart';
// import 'package:ego_vision/pages/product_page.dart';
// import 'package:ego_vision/widgets/custom_card.dart';
// import 'package:ego_vision/widgets/drawer.dart';
// import 'package:flutter/material.dart';
//
// class ViewMorePage extends StatefulWidget {
//   String sectionName;
//   ViewMorePage({super.key, required this.sectionName});
//
//   @override
//   State<ViewMorePage> createState() => _ViewMorePageState();
// }
//
// class _ViewMorePageState extends State<ViewMorePage> {
//   double productTextSize = 14.0;
//   double productPriceSize = 14.0;
//
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       print("index value: ${_selectedIndex}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 45,
//         backgroundColor: AppColor.secondary,
//         title: Text("${widget.sectionName}"),
//         // actions: [
//         //   Padding(
//         //     padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
//         //     child: ShoppingCartBadge(),
//         //   ),
//         // ],
//       ),
//       drawer: MyCustomDrawer(),
//       body: widget.sectionName == "Types"
//           ? Container(
//               padding: const EdgeInsets.only(
//                   top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
//               height: screenHeight,
//               width: screenWidth,
//               // color: AppColor.primary,
//               color: AppColor.primary,
//               child: GridView.builder(
//                 itemCount: sectionList[0]["pList"].length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 10,
//                     crossAxisCount: MediaQuery.of(context).orientation ==
//                             Orientation.landscape
//                         ? 4
//                         : 2,
//                     mainAxisExtent: 100),
//                 itemBuilder: (context, index) {
//                   return MyCustomCard(
//                     // cardIcon: SvgPicture.asset(
//                     //   'assets/icons/Bag.svg',
//
//                     //   height: 20.0,
//                     //   width: 20.0,
//                     //   color: Colors.white,
//                     // ),
//                     cardIcon: Image.asset(
//                       '${sectionList[0]["pList"][index]["sImage"]}',
//                       height: 30.0,
//                       width: 30.0,
//                     ),
//
//                     cardName: Text(
//                       // '${sectionList[index]["sectionName"]}',
//                       '${sectionList[0]["pList"][index]["sName"]}',
//
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     // data: categoryData[index],
//                     onTap: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ProductPage(),
//                           ));
//                     },
//                   );
//                 },
//               ),
//             )
//           : widget.sectionName == "Category"
//               ? Container(
//                   padding: const EdgeInsets.only(
//                       top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
//                   height: screenHeight,
//                   width: screenWidth,
//                   color: AppColor.primary,
//                   child: GridView.builder(
//                     itemCount: sectionList[1]["pList"].length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 10,
//                         crossAxisCount: MediaQuery.of(context).orientation ==
//                                 Orientation.landscape
//                             ? 4
//                             : 2,
//                         mainAxisExtent: 100),
//                     itemBuilder: (context, index) {
//                       return MyCustomCard(
//                         // cardIcon: SvgPicture.asset(
//                         //   'assets/icons/Bag.svg',
//
//                         //   height: 20.0,
//                         //   width: 20.0,
//                         //   color: Colors.white,
//                         // ),
//                         cardIcon: Image.asset(
//                           '${sectionList[1]["pList"][index]["sImage"]}',
//                           height: 30.0,
//                           width: 30.0,
//                         ),
//
//                         cardName: Text(
//                           // '${sectionList[index]["sectionName"]}',
//                           '${sectionList[1]["pList"][index]["sName"]}',
//
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                         // data: categoryData[index],
//                         onTap: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductPage(),
//                               ));
//                         },
//                       );
//                     },
//                   ),
//                 )
//               : widget.sectionName == "Brand"
//                   ? Container(
//                       padding: const EdgeInsets.only(
//                           top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
//                       height: screenHeight,
//                       width: screenWidth,
//                       color: AppColor.primary,
//                       child: GridView.builder(
//                         itemCount: sectionList[2]["pList"].length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisSpacing: 5,
//                             mainAxisSpacing: 10,
//                             crossAxisCount:
//                                 MediaQuery.of(context).orientation ==
//                                         Orientation.landscape
//                                     ? 4
//                                     : 2,
//                             mainAxisExtent: 100),
//                         itemBuilder: (context, index) {
//                           return MyCustomCard(
//                             // cardIcon: SvgPicture.asset(
//                             //   'assets/icons/Bag.svg',
//
//                             //   height: 20.0,
//                             //   width: 20.0,
//                             //   color: Colors.white,
//                             // ),
//                             cardIcon: Image.asset(
//                               '${sectionList[2]["pList"][index]["sImage"]}',
//                               height: 30.0,
//                               width: 30.0,
//                             ),
//
//                             cardName: Text(
//                               // '${sectionList[index]["sectionName"]}',
//                               '${sectionList[2]["pList"][index]["sName"]}',
//
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                             // data: categoryData[index],
//                             onTap: () {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ProductPage(),
//                                   ));
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   : widget.sectionName == "Color"
//                       ? Container(
//                           padding: const EdgeInsets.only(
//                               top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
//                           height: screenHeight,
//                           width: screenWidth,
//                           color: AppColor.primary,
//                           child: GridView.builder(
//                             itemCount: sectionList[3]["pList"].length,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisSpacing: 5,
//                                     mainAxisSpacing: 10,
//                                     crossAxisCount:
//                                         MediaQuery.of(context).orientation ==
//                                                 Orientation.landscape
//                                             ? 4
//                                             : 2,
//                                     mainAxisExtent: 100),
//                             itemBuilder: (context, index) {
//                               return MyCustomCard(
//                                 // cardIcon: SvgPicture.asset(
//                                 //   'assets/icons/Bag.svg',
//
//                                 //   height: 20.0,
//                                 //   width: 20.0,
//                                 //   color: Colors.white,
//                                 // ),
//                                 cardIcon: Image.asset(
//                                   '${sectionList[3]["pList"][index]["sImage"]}',
//                                   height: 30.0,
//                                   width: 30.0,
//                                 ),
//
//                                 cardName: Text(
//                                   // '${sectionList[index]["sectionName"]}',
//                                   '${sectionList[3]["pList"][index]["sName"]}',
//
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 12),
//                                 ),
//                                 // data: categoryData[index],
//                                 onTap: () {
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ProductPage(),
//                                       ));
//                                 },
//                               );
//                             },
//                           ),
//                         )
//                       : Center(
//                           child: Container(
//                           child: Text("No Section Found"),
//                         )),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//             border:
//                 Border(top: BorderSide(color: AppColor.primarySoft, width: 2))),
//         child: BottomNavigationBar(
//           onTap: (int index) {
//             setState(() {
//               _selectedIndex = index;
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PageSwitcher(
//                       selectedIndex: _selectedIndex,
//                     ),
//                   ),
//                   (route) => false);
//               print("SecondPage index value: ${_selectedIndex}");
//             });
//           },
//           showSelectedLabels: true,
//           showUnselectedLabels: false,
//           selectedItemColor: Colors.black,
//           items: [
//             (_selectedIndex == 0)
//                 ? BottomNavigationBarItem(
//                     icon: Icon(Icons.home, color: Colors.black), label: 'Home')
//                 : BottomNavigationBarItem(
//                     icon: Icon(Icons.home_outlined, color: Colors.black),
//                     label: ''),
//             (_selectedIndex == 1)
//                 ? BottomNavigationBarItem(
//                     icon: Icon(Icons.notifications, color: Colors.black),
//                     label: 'Pending Order')
//                 : BottomNavigationBarItem(
//                     icon: Icon(Icons.notifications_none_outlined,
//                         color: Colors.black),
//                     label: ''),
//             (_selectedIndex == 2)
//                 ? BottomNavigationBarItem(
//                     icon: Icon(Icons.dns, color: Colors.black),
//                     label: 'All Order')
//                 : BottomNavigationBarItem(
//                     icon: Icon(Icons.dns_outlined, color: Colors.black),
//                     label: ''),
//             (_selectedIndex == 3)
//                 ? BottomNavigationBarItem(
//                     icon: Icon(Icons.shopping_bag, color: Colors.black),
//                     label: 'Cart')
//                 : BottomNavigationBarItem(
//                     icon:
//                         Icon(Icons.shopping_bag_outlined, color: Colors.black),
//                     label: ''),
//             (_selectedIndex == 4)
//                 ? BottomNavigationBarItem(
//                     icon: Icon(Icons.person, color: Colors.black),
//                     label: 'Profile')
//                 : BottomNavigationBarItem(
//                     icon: Icon(Icons.person_outline_outlined,
//                         color: Colors.black),
//                     label: ''),
//           ],
//           currentIndex: _selectedIndex,
//         ),
//       ),
//     );
//   }
// }
//
// // TextButton(
// //   onPressed: () {
// //     Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) =>
// //               ViewMorePage(sectionName: 'Types'),
// //         ));
// //   },
// //   child: Container(
// //     color: Colors.grey.withOpacity(0.2),
// //     padding: EdgeInsets.all(3),
// //     child: Text(
// //       'View More',
// //       style: TextStyle(
// //           color: Colors.white.withOpacity(0.7),
// //           fontWeight: FontWeight.w400),
// //     ),
// //   ),
// //   style: TextButton.styleFrom(
// //     foregroundColor: Colors.white,
// //   ),
// // ),
