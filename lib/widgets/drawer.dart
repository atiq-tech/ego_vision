import 'package:ego_vision/page_switcher.dart';
import 'package:ego_vision/pages/ongoing_order_page.dart';
import 'package:ego_vision/pages/received_order_page.dart';
import 'package:ego_vision/pages/signup_login/login_page.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({super.key});

  @override
  State<MyCustomDrawer> createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  ScrollController _listViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey[200],
        width: screenWidth - 100,
        child: ListView(
          controller: _listViewController,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/profile.jpg",
                              fit: BoxFit.cover,
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Iqbal Riaz"),
                          Text("0123456789"),
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(selectedIndex: 0),
                      ),
                      (route) => false);
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.pending),
                title: Text("Pending Order"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(selectedIndex: 1),
                      ),
                      (route) => false);
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.update),
                title: Text("Ongoing Order"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OngoingOrderPage(),
                      ),
                      (route) => false);
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.mark_chat_read),
                title: Text("Received Order"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceivedOrderPage(),
                      ),
                      (route) => false);
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.all_inbox_outlined),
                title: Text("All Order"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageSwitcher(selectedIndex: 2),
                      ),
                      (route) => false);
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              height: 35,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
