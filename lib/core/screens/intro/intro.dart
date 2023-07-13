import 'dart:developer';

import 'package:amaj/core/screens/login/login.dart';
import 'package:amaj/core/widgets/each_page.dart';
import 'package:amaj/core/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  //Controller for the PageView
  PageController controller = PageController();

  final messages1 = [
    "آماج",
    "نقشه راه ",
    "تیم سازی کنید",
    "با هوش مصنوعی آماج"
  ];
  final messages2 = [
    "یک قدم تارسیدن به اوج",
    "مسیری درست برای پیشرفت کردن و توسعه فردی میدهد",
    "و در کنار توسعه کسب و کار آنلاین خود ، درآمدزایی کنید",
    "در کنار داشتن یک مشاور جامع هدفمند قدم بردار"
  ];
  final images = [
    'assets/images/intro/slide1.png',
    'assets/images/intro/slide2.png',
    'assets/images/intro/slide3.png',
    'assets/images/intro/slide4.png',
  ];
  final backs = [
    'assets/images/intro/Vector-bg1.png',
    'assets/images/intro/Vector-bg2.png',
    'assets/images/intro/Vector-bg3.png',
    'assets/images/intro/Vector-bg4.png',
  ];

  int numberOfPages = 4;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: numberOfPages,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return EachPage(
                messages1[index],
                messages2[index],
                images[index],
                backs[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .2),
              child: SmoothPageIndicator(
                  textDirection: TextDirection.ltr,
                  controller: controller, // PageController
                  count: numberOfPages,
                  effect: WormEffect(
                      dotColor: Color.fromARGB(122, 217, 217, 217),
                      activeDotColor: Color(0xFF222A3B),
                      dotWidth: 10,
                      dotHeight: 10), // your preferred effect
                  onDotClicked: (index) {}),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (currentPage == numberOfPages - 1)
                      ? Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 20),
                          child: GestureDetector(
                              onTap: () {},
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.only(left: 20 , right: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: BorderSide(color: Colors.white ) ,

                                    )),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ));
                                },
                                child: Text("ثبت نام",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'isans')),
                              )),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              controller.jumpToPage(numberOfPages - 3);
                            },
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  padding: EdgeInsets.only(left: 30 , right: 30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: BorderSide(color: Colors.white ))),
                              onPressed: () {
                                controller.animateToPage(currentPage + 1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCirc);
                              },
                              child: Text("ادامه",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'isans')),
                            ),
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
