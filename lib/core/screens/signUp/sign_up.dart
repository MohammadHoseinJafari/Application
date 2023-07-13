import 'package:amaj/core/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: getContent(),
    );
  }

  getContent() {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              left: 0,
              child: Image(
                image: AssetImage('assets/images/intro/sign_up_vector.png'),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image(
                image:
                    AssetImage('assets/images/intro/sign_up_button_vector.png'),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 160, left: 90),
                      child: Text(
                        "آماجی شوید!",
                        style: TextStyle(
                            color: Color(0XFF222A3B),
                            fontFamily: "isans",
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30.0),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  label: Text("نام"),
                                  labelStyle: TextStyle(
                                      color: Color(0XFF222A3B).withOpacity(0.7)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0XFF222A3B), width: 1))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30.0),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color(0XFF222A3B).withOpacity(0.7)),
                                label: Text("ایمیل"),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF222A3B), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30.0),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color(0XFF222A3B).withOpacity(0.7)),
                                label: Text("رمزعبور"),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF222A3B), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30.0),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color(0XFF222A3B).withOpacity(0.7)),
                                label: Text("تکرار رمزعبور"),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF222A3B), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('ثبت نام'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFF4500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: Colors.white, width: .2))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "آیا از قبل اکانت داشته اید؟",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: "isans"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    " ورود ",
                                    style: TextStyle(
                                        color: Color(0xffFF4500),
                                        fontFamily: "isans"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
      ),
    );
  }
}
