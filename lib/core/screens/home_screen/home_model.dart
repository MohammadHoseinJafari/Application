import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final images = [
  'assets/images/icons/microsoft.png',
  'assets/images/icons/google.png',
  'assets/images/icons/amazon.png',
  'assets/images/icons/netflix.png',
  'assets/images/icons/benz.png',
  'assets/images/icons/fb.png',
  'assets/images/icons/ibm.png',
  'assets/images/icons/mac.png',
];

class MyClass {
  final int id;
  final String companyName;
  final String location;
  final String job_title;
  final int last;
  final int applicant;
  final String jobSite;
  final String jobType;
  final String req;
  final String des;
  final String phone;
  final String email;

  MyClass({
    required this.id,
    required this.companyName,
    required this.location,
    required this.job_title,
    required this.last,
    required this.applicant,
    required this.jobSite,
    required this.jobType,
    required this.req,
    required this.des,
    required this.phone,
    required this.email,
  });
}

class MyApiService {
  static const String apiUrl = 'https://amaje.iran.liara.run/api/';

  Future<List<MyClass>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonData['results'] is List) {
        final List<dynamic> results = jsonData['results'];
        return results.map<MyClass>((data) {
          print(data);
          return MyClass(
            id: data['id'] ?? 0,
            companyName: data['company_name'] ?? 'Unknown Company',
            location: data['location'] ?? 'Unknown Location',
            job_title: data['job_title'] ?? 'Unknown Job Title',
            last: data['last'] ?? 0,
            applicant: data['applicant'] ?? 0,
            jobSite: data['job_site'] ?? 'Unknown Job Site',
            jobType: data['job_type'] ?? 'Unknown Job Type',
            req: data['req'] ?? 'Unknown Req',
            des: data['des'] ?? 'Unknown Description',
            phone: data['phone'] ?? 'Unknown Phone',
            email: data['email'] ?? 'Unknown Email',
          );
        }).toList();
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class HomeModel extends ChangeNotifier {
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}

class NavBarModel extends ChangeNotifier{
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}

class SavedPageModel extends ChangeNotifier{
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}

class SearchPageModel extends ChangeNotifier{
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}

class BrainPageModel extends ChangeNotifier{
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}

class UserPageModel extends ChangeNotifier{
  int selectedMenuItemIndex = 0;

  void changeSelectedMenuItemIndex(int index) {
    selectedMenuItemIndex = index;
    notifyListeners();
  }
}
