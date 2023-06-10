import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/model/dummy/product_list.dart';
import 'package:ego_vision/page_switcher.dart';
import 'package:ego_vision/pages/all_product_page.dart';
import 'package:ego_vision/pages/product_page.dart';
import 'package:ego_vision/provider/brand_provider.dart';
import 'package:ego_vision/provider/category_provider.dart';
import 'package:ego_vision/provider/color_provider.dart';
import 'package:ego_vision/provider/hive_provider.dart';
import 'package:ego_vision/provider/type_provider.dart';
import 'package:ego_vision/widgets/custom_card.dart';
import 'package:ego_vision/widgets/drawer.dart';
import 'package:ego_vision/widgets/dummy_search_widget_1.dart';
import 'package:ego_vision/widgets/shimmer/shimmer_1_row.dart';
import 'package:ego_vision/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Box box;

  ScrollController _singleChildScrollViewController = ScrollController();
  ScrollController _listView1Controller = ScrollController();
  ScrollController _listView2Controller = ScrollController();
  ScrollController _listView3Controller = ScrollController();
  ScrollController _listView4Controller = ScrollController();

  @override
  void initState() {
    box = Hive.box('productBox');
    Provider.of<CategoryProvider>(context, listen: false).getCategory(context);
    Provider.of<TypeProvider>(context, listen: false).getType(context);
    Provider.of<BrandProvider>(context, listen: false).getBrand(context);
    Provider.of<ColorProvider>(context, listen: false).getColor(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).provideCategoryList;
    final typeList = Provider.of<TypeProvider>(context).provideTypeList;
    final brandList = Provider.of<BrandProvider>(context).provideBrandList;
    final colorList = Provider.of<ColorProvider>(context).provideColorList;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(
                          selectedIndex: 4,
                        ),
                      ),
                      (route) => false);
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 12),
                height: 40,
                width: 40,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            Text(
              "Iqbal Riaz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
            child: ShoppingCartBadge(),
          )
        ],
      ),
      drawer: MyCustomDrawer(),
      body: SingleChildScrollView(
        controller: _singleChildScrollViewController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xffecedee)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DummySearchWidget1(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProductPage(),
                          ));
                    },
                  ),
                  //==============================Types list==============================
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Types',
                      style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16),
                    child: typeList.isEmpty
                        ? Center(
                            child: Shimmer1Row(),
                          )
                        : ListView.builder(
                            controller: _listView1Controller,
                            physics: BouncingScrollPhysics(),
                            itemCount: typeList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 100,
                                  child: MyCustomCard(
                                    cardIcon: Image.asset(
                                      '${productImageList[0]["typeImage"]}',
                                      height: 25.0,
                                      width: 25.0,
                                    ),
                                    cardName: Text(
                                      '${typeList[index].name}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black87, fontSize: 12),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductPage(
                                              productKey: "typeId",
                                              productValue: "${typeList[index].id}",
                                            ),
                                          ));
                                    },
                                  ));
                            },
                          ),
                  ),

                  //==============================Category list==============================
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Category',
                      style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16),
                    child: categoryList.isEmpty
                        ? Center(
                            child: Shimmer1Row(),
                          )
                        : ListView.builder(
                            controller: _listView2Controller,
                            itemCount: categoryList.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 100,
                                  child: MyCustomCard(
                                    cardIcon: Image.asset(
                                      '${productImageList[0]["categoryImage"]}',
                                      height: 25.0,
                                      width: 25.0,
                                    ),
                                    cardName: Text(
                                      '${categoryList[index].productCategoryName}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black87, fontSize: 12),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductPage(
                                              productKey: "catId",
                                              productValue: "${categoryList[index].productCategorySlNo}",
                                            ),
                                          ));
                                    },
                                  ));
                            },
                          ),
                  ),

                  //==============================Brand list==============================
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Brand',
                          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16),
                    child: brandList.isEmpty
                        ? Center(
                            child: Shimmer1Row(),
                          )
                        : ListView.builder(
                            controller: _listView3Controller,
                            itemCount: brandList.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 100,
                                  child: MyCustomCard(
                                    cardIcon: Image.asset(
                                      '${productImageList[0]["brandImage"]}',
                                      height: 25.0,
                                      width: 25.0,
                                    ),
                                    cardName: Text(
                                      '${brandList[index].brandName}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black87, fontSize: 12),
                                    ),
                                    // data: categoryData[index],
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductPage(
                                              productKey: "brandId",
                                              productValue: "${brandList[index].brandSiNo}",
                                            ),
                                          ));
                                    },
                                  ));
                            },
                          ),
                  ),

                  //==============================Color list==============================
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Color',
                          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16),
                    child: colorList.isEmpty
                        ? Center(
                            child: Shimmer1Row(),
                          )
                        : ListView.builder(
                            controller: _listView4Controller,
                            itemCount: colorList.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: 100,
                                child: MyCustomCard(
                                  cardIcon: Image.asset(
                                    '${productImageList[0]["colorImage"]}',
                                    height: 25.0,
                                    width: 25.0,
                                  ),
                                  cardName: Text(
                                    '${colorList[index].colorName}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black87, fontSize: 12),
                                  ),
                                  // data: categoryData[index],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductPage(
                                            productKey: "colorId",
                                            productValue: "${colorList[index].colorSiNo}",
                                          ),
                                        ));
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            //========================Section 3 Image========================
            Container(
              height: 220,
              margin: EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Carousel(
                  indicatorBarColor: Colors.transparent,
                  autoScrollDuration: Duration(seconds: 2),
                  animationPageDuration: Duration(milliseconds: 200),
                  activateIndicatorColor: Colors.black,
                  animationPageCurve: Curves.linear,
                  indicatorBarHeight: 20,
                  indicatorHeight: 10,
                  indicatorWidth: 10,
                  unActivatedIndicatorColor: Colors.grey,
                  stopAtEnd: false,
                  autoScroll: true,
                  // widgets
                  items: [
                    Container(
                      child: Image.asset(
                        "assets/images/ego1.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/ego2.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/ego3.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/ego4.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
