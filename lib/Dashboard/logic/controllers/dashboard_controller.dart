import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  List<String> sideNav = ['Overview', 'Opened', 'Closed'];
  List<String> casesItem = ['Opened', 'Closed', 'On hold', 'Total Chat'];

  String selected = '';

  void checkSelected(String title) {
    selected = title;
    update();
  }

  Color getColor(item) {
    if (item == casesItem[0]) {
      return Colors.green;
    } else if (item == casesItem[1]) {
      return Colors.grey;
    } else if (item == casesItem[2]) {
      return Colors.redAccent;
    } else
      return Colors.black;
  }
}
