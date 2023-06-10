import 'package:ego_vision/constant/app_color.dart';
import 'package:ego_vision/widgets/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double textFormFieldHeight = 40.0;
  double textFontSize = 16.0;

  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  ScrollController _listViewController = ScrollController();

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  void _toggle3() {
    setState(() {
      _obscureText3 = !_obscureText3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h1TextSize = 18.0;
    double h2TextSize = 14.0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        // title: Text("test bar"),
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        controller: _listViewController,
        shrinkWrap: true,
        // physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture - Username - Name
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // Profile Picture
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Fullname
                Container(
                  margin: EdgeInsets.only(bottom: 4, top: 14),
                  child: Text(
                    'Iqbal Riaz',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                // Username
                Text(
                  '@iqbalriiaz',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
                ),
              ],
            ),
          ),
          // Section 2 - Account Menu
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Text(
                        'Account Information',
                        style: TextStyle(
                          fontSize: h1TextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer ID',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'EV001374',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Owner Name',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Iqbal Riaz',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '01521436783',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'helloriiaz@gmail.com',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Dhaka',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Officer',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Iqbal Riaz',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Organization',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                                fontSize: h2TextSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Link-Up Technology',
                            style: TextStyle(
                              color: AppColor.secondary.withOpacity(0.5),
                              fontSize: h2TextSize,
                            ),
                          ),
                        ],
                      ),
                      ListTileTheme(
                        contentPadding: EdgeInsets.all(0),
                        child: ExpansionTile(
                          title: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: h1TextSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  color: Color(0xff002A56),
                                  child: Center(
                                    child: Text(
                                      'Update Password',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Old Password",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: textFontSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: textFormFieldHeight,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: oldPassController,
                                      obscureText: _obscureText1,
                                      decoration: InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0, right: 0.0),
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(_obscureText1 ? Icons.visibility_off : Icons.visibility),
                                            onPressed: () {
                                              _toggle1();
                                            },
                                          )),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return null;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "New Password",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: textFontSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: textFormFieldHeight,
                                  child: TextFormField(
                                    controller: newPassController,
                                    obscureText: _obscureText2,
                                    decoration: InputDecoration(
                                        filled: true,
                                        contentPadding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0, right: 0.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(_obscureText2 ? Icons.visibility_off : Icons.visibility),
                                          onPressed: () {
                                            _toggle2();
                                          },
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: textFontSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: textFormFieldHeight,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: confirmPassController,
                                      obscureText: _obscureText3,
                                      decoration: InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0, right: 0.0),
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(_obscureText3 ? Icons.visibility_off : Icons.visibility),
                                            onPressed: () {
                                              _toggle3();
                                            },
                                          )),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return null;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(onPressed: () {}, child: Text("Update")))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
