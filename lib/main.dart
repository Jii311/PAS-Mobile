import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/component/team_detailed.dart';
import 'package:pas1_mobile_11pplg2_11/pages/dashboard_page.dart';
import 'package:pas1_mobile_11pplg2_11/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        //list all pages
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
        ),
        GetPage(name: '/detailed', page: () => TeamDetailed()),
      ],
    );
  }
}
