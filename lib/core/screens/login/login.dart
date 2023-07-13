import 'package:amaj/config/constants.dart';
import 'package:amaj/core/screens/home_screen/home_model.dart';
import 'package:amaj/core/screens/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_screen/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: getContent(),
      ),
    );
  }

  getContent() {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Positioned(
            child: Image(
              image: AssetImage('assets/images/intro/login_vector.png'),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/intro/login_button_vector.png'),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 30),
                  child: Text(
                    "خوش آمدید",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "isans",
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 70, right: 30, bottom: 0, left: 30),
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            label: Text("ایمیل"),
                            labelStyle:
                                TextStyle(color: Color(0XFF222A3B).withOpacity(0.8)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF222A3B), width: 1))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 30, bottom: 30, left: 30),
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Color(0XFF222A3B).withOpacity(0.8),fontFamily:'isans'),
                          label: Text("گذرواژه"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0XFF222A3B), width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider<NavBarModel>(
                                  create: (context) => NavBarModel(),
                                  child: MyNavigationBar(),
                                ),
                              ),
                            );
                          },
                          child: Text('ورود'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFF4500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                      color: Colors.white, width: .2))),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "آیا از قبل اکانت نداشته اید؟",
                        style:
                            TextStyle(color: Colors.white, fontFamily: "isans"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          " ثبت نام ",
                          style: TextStyle(
                              color: Color(0xffFF4500), fontFamily: "isans"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            top: 15,
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Container(
                  width: 50,
                  height: 50,
                  child:
                  Image(image: AssetImage(("assets/icons/ic_back.png")))),
            ),
          ),

        ],
      ),
    );
  }
}
