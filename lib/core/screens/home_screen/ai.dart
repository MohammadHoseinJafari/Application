import 'dart:math';
import 'package:flutter/material.dart';
import 'package:amaj/core/screens/home_screen/home_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BrainPage extends StatefulWidget {
  const BrainPage({super.key});

  @override
  State<BrainPage> createState() => _BrainPageState();
}

class _BrainPageState extends State<BrainPage> {
  SearchPageModel get model =>
      Provider.of<SearchPageModel>(context, listen: false);
  int selected = 0;
  PageController pageController =
  PageController(viewportFraction: .8, initialPage: 1);

  final MyApiService apiService = MyApiService();
  MyApiService get getApiService => apiService;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .15,
                  decoration: BoxDecoration(
                      color: Color(0XFF222A3B),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: 90, right: 20, left: 20, bottom: 10),
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                0.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .85,
                            child: FloatingNavbar(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .8,
                              onTap: (int val) {
                                setState(() {
                                  selected = val;
                                });
                                print(val);
                                model.changeSelectedMenuItemIndex(val);
                                print(model.selectedMenuItemIndex);
                              },
                              currentIndex: selected,
                              backgroundColor: Colors.white,
                              selectedBackgroundColor: Color(0XFFFF4500),
                              items: [
                                FloatingNavbarItem(
                                    customWidget: Container(
                                      child: Text(
                                        'جاب آفر',
                                        style: selected == 0
                                            ? TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)
                                            : TextStyle(color: Colors.black),
                                      ),
                                    )),
                                FloatingNavbarItem(
                                    customWidget: Container(
                                      child: Text(
                                        'جستجو',
                                        style: selected == 1
                                            ? TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)
                                            : TextStyle(color: Colors.black),
                                      ),
                                    )),
                                FloatingNavbarItem(
                                    customWidget: Container(
                                      child: Text(
                                        'پروژه ها',
                                        style: selected == 2
                                            ? TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)
                                            : TextStyle(color: Colors.black),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: FutureBuilder<List<MyClass>>(
                future: apiService.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return PageView.builder(
                        controller: pageController,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          final myClass = data[index];
                          Random random = Random();
                          String randomImagePath = images[random.nextInt(images.length)];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color(0XFFEEEEEE),
                                  borderRadius: BorderRadius.circular(15)),

                              child: getCards(randomImagePath,
                                  myClass.companyName, myClass.location  , myClass.job_title, myClass.jobType , myClass.jobSite , myClass.last , myClass.applicant ),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Center(
                      child: SpinKitDoubleBounce(
                        color: Color(0xFFFF4500), // Customize the color if needed
                        size: 50.0, // Customize the size if needed
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child:Container(
                  width: double.infinity,
                  color: Color(0xFF222A3B),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image(image: AssetImage('assets/images/intro/cant.png')),
                        ),
                      ),
                      Container(
                        width: 335,
                        child:Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text("برای مشاهده موقعیت های شغلی متناسب با رزومه شما ، ابتدا پروفایل خود را کامل کنید",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14
                              ),
                              textAlign: TextAlign.center,
                            ),
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

  Padding getCards(String imagePath, String companyName, String location,
      String jobTitle , String job_Type , String job_Site , int _last , int _applicant) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    location,
                    style: TextStyle(color: Color(0XFF222A3B), fontSize: 11),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark_border_rounded)
            ],
          ),
          Spacer(),
          Text(
            jobTitle,
            style: TextStyle(
                color: Color(0XFF222A3B),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                _last.toString() + ' روز پیش',
                style: TextStyle(color: Color(0XFF222A3B), fontSize: 11),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                _applicant.toString() + ' درخواست کننده',
                style: TextStyle(fontSize: 11, color: Color(0XFF222A3B)),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0XFF222A3B)),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Text(
                  job_Type,
                  style: TextStyle(color: Color(0XFF222A3B), fontSize: 11),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0XFF222A3B)),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Text(
                  job_Site,
                  style: TextStyle(color: Color(0XFF222A3B), fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding getRowCards(String imagePath, String companyName, String locationCountry,
      String locationCity, String jobTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage('assets/images/icons/microsoft.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobTitle,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    locationCountry + ' - ' + locationCity,
                    style: TextStyle(color: Color(0XFF222A3B), fontSize: 11),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark_border_rounded)
            ],
          ),
        ],
      ),
    );
  }


}