import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/widgets/custom_icon_button_widget.dart';
import 'package:ego_vision/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllOrderPage extends StatefulWidget {
  const AllOrderPage({super.key});

  @override
  State<AllOrderPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<AllOrderPage> {
  ScrollController _listViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("All Order"),
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
    );
  }
}
