import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/page_switcher.dart';
import 'package:ego_vision/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ReceivedOrderPage extends StatefulWidget {
  const ReceivedOrderPage({super.key});

  @override
  State<ReceivedOrderPage> createState() => _ReceivedOrderPageState();
}

class _ReceivedOrderPageState extends State<ReceivedOrderPage> {
  int _selectedIndex = 0;
  ScrollController _listViewController = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("index value: ${_selectedIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("Received Order"),
        backgroundColor: AppColor.primary,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 247, 246, 246),
      drawer: MyCustomDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          controller: _listViewController,
          padding: const EdgeInsets.only(
            top: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => SomePage,
                //     ));
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date: 2023-01-30"),
                          Text("06:42 pm"),
                          Text("Iqbal Riaz"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Invoice: 123456"),
                          Text("Total: \$ 100"),
                        ],
                      ),
                      InkWell(onTap: () {}, child: Icon(Icons.edit_calendar))
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColor.primarySoft, width: 2))),
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
                ? BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: 'Home')
                : BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black), label: ''),
            (_selectedIndex == 1)
                ? BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black), label: 'Pending Order')
                : BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined, color: Colors.black), label: ''),
            (_selectedIndex == 2)
                ? BottomNavigationBarItem(icon: Icon(Icons.dns, color: Colors.black), label: 'All Order')
                : BottomNavigationBarItem(icon: Icon(Icons.dns_outlined, color: Colors.black), label: ''),
            (_selectedIndex == 3)
                ? BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.black), label: 'Cart')
                : BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, color: Colors.black), label: ''),
            (_selectedIndex == 4)
                ? BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Profile')
                : BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined, color: Colors.black), label: ''),
          ],
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
