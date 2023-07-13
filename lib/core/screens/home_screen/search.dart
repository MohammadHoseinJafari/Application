import 'dart:math';
import 'package:flutter/material.dart';
import 'package:amaj/core/screens/home_screen/home_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageModel get model => Provider.of<SearchPageModel>(context, listen: false);
  int selected = 0;
  PageController pageController =
  PageController(viewportFraction: .8, initialPage: 1);

  final MyApiService apiService = MyApiService();
  MyApiService get getApiService => apiService;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: search_content()
      ),
    );
  }

  search_content(){
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                decoration: BoxDecoration(
                    color: Color(0XFF222A3B),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0))),
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
                child: Padding(
                  padding: const EdgeInsets.only(top:0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .84,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image(image: AssetImage('assets/images/intro/searching.png')),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .94,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'به دنبال چیزی میگردید',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF222A3B),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  child : Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * .4,
                                      child: FutureBuilder<List<MyClass>>(
                                        future: apiService.fetchData(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final data = snapshot.data!;
                                            return ListView.builder(
                                              controller: pageController,
                                              itemCount: 4, //data.length,
                                              itemBuilder: (context, index) {
                                                final myClass = data[index];
                                                Random random = Random();
                                                String randomImagePath = images[random.nextInt(images.length)];
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                  child: Container(
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10)),
                                                    child: getRowCards(randomImagePath,
                                                        myClass.companyName, myClass.location , myClass.jobType , myClass.job_title),
                                                  ),
                                                );
                                              },
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text('Error: ${snapshot.error}');
                                          } else {
                                            return Center(
                                              child: SpinKitDoubleBounce(
                                                color: Colors.white ,
                                                size: 50.0, // Customize the size if needed
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              )
          )
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


