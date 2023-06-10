import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/pages/all_order_page.dart';
import 'package:ego_vision/pages/cart_page.dart';
import 'package:ego_vision/pages/pending_order_page.dart';
import 'package:ego_vision/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class PageSwitcher extends StatefulWidget {
  int selectedIndex;
  PageSwitcher({super.key, required this.selectedIndex});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        PendingOrderPage(),
        AllOrderPage(),
        CartScreen(),
        ProfilePage(),
      ][widget.selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColor.primarySoft, width: 2))),
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              widget.selectedIndex = index;
              print("index value: ${widget.selectedIndex}");
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          // unselectedItemColor: Colors.grey,
          items: [
            (widget.selectedIndex == 0)
                ? BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: 'Home')
                : BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black), label: ''),
            (widget.selectedIndex == 1)
                ? BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black), label: 'Pending Order')
                : BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined, color: Colors.black), label: ''),
            (widget.selectedIndex == 2)
                ? BottomNavigationBarItem(icon: Icon(Icons.dns, color: Colors.black), label: 'All Order')
                : BottomNavigationBarItem(icon: Icon(Icons.dns_outlined, color: Colors.black), label: ''),
            (widget.selectedIndex == 3)
                ? BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.black), label: 'Cart')
                : BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, color: Colors.black), label: ''),
            (widget.selectedIndex == 4)
                ? BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Profile')
                : BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined, color: Colors.black), label: ''),
          ],
          currentIndex: widget.selectedIndex,
        ),
      ),
    );
  }
}
