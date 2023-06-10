import 'dart:convert';

import 'package:ego_vision/constant/api_const.dart';
import 'package:ego_vision/page_switcher.dart';
import 'package:ego_vision/pages/signup_login/signup_page.dart';
import 'package:ego_vision/provider/hive_provider.dart';
import 'package:ego_vision/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../constant/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _singleChildScrollViewController = ScrollController();

      Fechlogin(context)async{
        String link="http://egovision24.com/androidApp/login.php";
        Map<String , dynamic> map={};
        map["phone"]=_idController.text.toString();
        map['password']=_passwordController.text.toString();
        try{
          Response response=await http.post(Uri.parse(link),body:map);
           print(response.body);
          var item=jsonDecode(response.body);
          if(item["success"]=="Login Success"){

          GetStorage().write("id",item["user"]["id"]);
          GetStorage().write("code",item["user"]["code"]);
          GetStorage().write("name",item["user"]["name"]);
          GetStorage().write("phone",item["user"]["phone"]);
          GetStorage().write("address",item["user"]["address"]);
          GetStorage().write("organization_name",item["user"]["organization_name"]);
          GetStorage().write("image",item["user"]["image"]);
          GetStorage().write("status",item["user"]["status"]);
          GetStorage().write("branch_id",item["user"]["branch_id"]);
          GetStorage().write("Customer_SlNo",item["user"]["Customer_SlNo"]);
          GetStorage().write("owner_name",item["user"]["owner_name"]);
          GetStorage().write("Customer_Mobile",item["user"]["Customer_Mobile"]);
          GetStorage().write("Customer_Email",item["user"]["Customer_Email"]);
          GetStorage().write("Customer_Address",item["user"]["Customer_Address"]);
          GetStorage().write("area",item["user"]["area"]);
          GetStorage().write("officer_name",item["user"]["officer_name"]);
          GetStorage().write("due",item["due"]);

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content:Text(item["success"]),
                ),
            );
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 1),
                content:Text(item["success"]),
              ),
            );
          }

        }catch(e){
          print(e);
        }
      }
  @override
  void initState() {
    Provider.of<HiveProvider>(context,listen: false);
    //checkUserState(context);
    super.initState();
  }

  @override
  Future<void> dispose() async {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
  print(GetStorage().read("id"));
    print(GetStorage().read("code"));
    print(GetStorage().read("name"));
    print(GetStorage().read("phone"));
    print(GetStorage().read("address"));
    print(GetStorage().read("organization_name"));
    print(GetStorage().read("image"));
    print(GetStorage().read("status"));
    print(GetStorage().read("branch_id"));
    print(GetStorage().read("Customer_SlNo"));
    print(GetStorage().read("owner_name"));
    print(GetStorage().read("Customer_Mobile"));
    print(GetStorage().read("Customer_Email"));
    print(GetStorage().read("Customer_Address"));
    print(GetStorage().read("area"));
    print(GetStorage().read("officer_name"));
    print(GetStorage().read("due"));

    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                controller: _singleChildScrollViewController,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/ego_vision.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextFormFieldWithBorder().getCustomEditTextArea(
                              fillColor: Colors.blueGrey,
                              isObscureText: false,
                              hintValue: 'User ID',
                              textStyle: TextStyle(color: Colors.white),
                              myPrefixIcon: Icon(Icons.person, color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                              isFilled: true,
                              validation: true,
                              controller: _idController,
                              keyboardType: TextInputType.text,
                              validationErrorMsg: 'error_msg')),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextFormFieldWithBorder().getCustomEditTextArea(
                              fillColor: Colors.blueGrey,
                              hintValue: 'Password',
                              textStyle: TextStyle(color: Colors.white),
                              isObscureText: _obscureText,
                              myPrefixIcon: Icon(Icons.lock, color: Colors.white),
                              mySuffixIcon: IconButton(
                                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                                onPressed: () {
                                  _toggle();
                                },
                              ),
                              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                              isFilled: true,
                              validation: true,
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              validationErrorMsg: 'error_msg')),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Fechlogin(context);
                            print("Login button clicked");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => PageSwitcher(selectedIndex: 0)),
                                (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          minimumSize: Size.fromHeight(50),
                        ),
                        child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: (() {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => SignupPage(),
                              //     ),
                              //     (route) => false);
                              Navigator.pushAndRemoveUntil(context, _createRoute(), (route) => false);
                            }),
                            child: Text(
                              'Signup',
                              style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignupPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.bounceIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
