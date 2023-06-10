import 'package:ego_vision/page_switcher.dart';
import 'package:ego_vision/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../provider/hive_provider.dart';

class ShoppingCartBadge extends StatefulWidget {
  const ShoppingCartBadge({Key? key}) : super(key: key);

  @override
  State<ShoppingCartBadge> createState() => _ShoppingCartBadgeState();
}

class _ShoppingCartBadgeState extends State<ShoppingCartBadge> {
  int _cartBadgeAmount = 1;

  late final Box box;

  // Add info to people box
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
    Provider.of<HiveProvider>(context, listen: false).getCounter(context);
  }

  @override
  Widget build(BuildContext context) {
    final hiveList = Provider.of<HiveProvider>(context);
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: badges.BadgeAnimation.slide(
          // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
          // curve: Curves.easeInCubic,
          ),
      showBadge: true,
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      badgeContent: Text(
        "${hiveList.getCounter(box.length)}",
        style: TextStyle(color: Colors.white, fontSize: 8),
      ),
      child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(
                    selectedIndex: 3,
                  ),
                ),
                (route) => false).then((value) {
              setState(() {});
            });
          }),
    );
  }
}
