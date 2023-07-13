import 'package:shared_preferences/shared_preferences.dart';
import 'package:amaj/core/screens/home_screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:amaj/core/screens/home_screen/home_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


Future<void> _logout(BuildContext context) async {

  await _clearUserSession();

  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}

Future<void> _clearUserSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  await prefs.remove('userId');
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

Future<void> clearUserSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove('accessToken');
  await prefs.remove('userId');
}

class _UserPageState extends State<UserPage> {
  SearchPageModel get model => Provider.of<SearchPageModel>(context, listen: false);
  int selected = 0;
  PageController pageController =
  PageController(viewportFraction: .8, initialPage: 1);

  get customWidget => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222A3B),
        appBar: null,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .1,
                  decoration: BoxDecoration(
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/icons/logo.png'),
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'آماج',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon:
                            Icon(Icons.notifications, color: Colors.white))
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Expanded(
                child:Container(
                  width: double.infinity,
                  color: Color(0xFF222A3B),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width:  MediaQuery
                                .of(context)
                                .size
                                .width * .7,
                            child : Image(image: AssetImage('assets/images/intro/me.png')),
                          )
                        ),
                      ),
                      Container(
                          width: 335,
                          child:Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text("محمدحسین جعفری",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                      ),
                      Container(
                          width: 335,
                          child:Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text("برنامه نویس پایتون",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text("دانشجوی مهندسی کامپیوتر",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text("طراحی اپلیکیشن (درس مباحث ویژه اندروید)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text("استاد آذربنیاد",
                                      style: TextStyle(
                                        color: Color(0xFFFF4500),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFF4500), // Background color
                                          onPrimary: Colors.white, // Text color
                                          textStyle: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold), // Text style
                                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Button padding
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10), // Button border radius
                                          ),
                                        ),
                                        onPressed: () {
                                          const url = 'https://www.linkedin.com/in/mohamad-hosein-jafari-44a939277/';
                                          launchUrlString(url);
                                        },
                                        child: Text('مشاهده پروفایل لینکدین من'), // Button text
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:  Colors.white , // Background color
                                          onPrimary:Color(0xFF222A3B), // Text color
                                          textStyle: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold), // Text style
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Button padding
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10), // Button border radius
                                          ),
                                        ),
                                        onPressed: () {
                                          _logout(context);
                                        },
                                        child: Text('خروج از حساب کاربری'), // Button text
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ),
                          )
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}