import 'package:dashboard/route/routes.dart';
import 'package:dashboard/view/screen/dashborad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.dashboard,
      getPages: AppRoutes.routes,
      // home:  DashboardScreen(),
    );
  }
}
