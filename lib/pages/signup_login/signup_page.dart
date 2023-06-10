import 'package:flutter/material.dart';
import '../../constant/app_color.dart';
import '../../widgets/custom_text_form_field.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ScrollController _singleChildScrollViewController = ScrollController();

  @override
  void initState() {
    //checkUserState(context);
    super.initState();
  }

  @override
  Future<void> dispose() async {
    _idController.dispose();
    _emailController.dispose();
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

    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   toolbarHeight: 45,
            //   backgroundColor: Color.fromARGB(255, 87, 117, 133),
            //   title: const Text('Sign In'),
            // ),
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
                              isObscureText: false,
                              hintValue: 'Email',
                              textStyle: TextStyle(color: Colors.white),
                              myPrefixIcon: Icon(Icons.mail, color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                              isFilled: true,
                              validation: true,
                              controller: _emailController,
                              keyboardType: TextInputType.text,
                              validationErrorMsg: 'error_msg')),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print("Signup button clicked");
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             PageSwitcher(selectedIndex: 0)),
                            //     (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          minimumSize: Size.fromHeight(50),
                        ),
                        child: Text("Signup", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
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
                              //       builder: (context) => LoginPage(),
                              //     ),
                              //     (route) => false);
                              Navigator.pushAndRemoveUntil(context, _createRoute(), (route) => false);
                            }),
                            child: Text(
                              'Login',
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
      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
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
