import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../page_switcher.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  double productTextSize = 14.0;
  double productPriceSize = 14.0;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColor.primarySoft, width: 2))),
      child: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PageSwitcher(
                    selectedIndex: _selectedIndex,
                  ),
                ),
                (route) => false);
            print("SecondPage index value: ${_selectedIndex}");
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          (_selectedIndex == 0)
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black), label: 'Home')
              : BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: Colors.black),
                  label: ''),
          (_selectedIndex == 1)
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  label: 'Pending Order')
              : BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined,
                      color: Colors.black),
                  label: ''),
          (_selectedIndex == 2)
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.dns, color: Colors.black),
                  label: 'All Order')
              : BottomNavigationBarItem(
                  icon: Icon(Icons.dns_outlined, color: Colors.black),
                  label: ''),
          (_selectedIndex == 3)
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag, color: Colors.black),
                  label: 'Cart')
              : BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                  label: ''),
          (_selectedIndex == 4)
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.black),
                  label: 'Profile')
              : BottomNavigationBarItem(
                  icon:
                      Icon(Icons.person_outline_outlined, color: Colors.black),
                  label: ''),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
