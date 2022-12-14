import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  List<String> sideNav = ['Overview', 'Opened', 'Closed'];
  List<String> casesItem = ['Opened', 'Closed', 'On hold', 'Total Chat'];

  String selected = '';

  final db = FirebaseFirestore.instance;

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

  // Future<String> getUserName(String userId) async {
  //   String userName = '';
  //   var users = db.collection('users').doc(userId);

  //   await users.get().then((value) => {userName = value['name'].toString()});

  //   return userName;
  // }

  String timestampToDesiredFormat(msgTime) {
    if (msgTime == null) {
      String formattedTime = DateFormat.jm().format(DateTime.now());
      return formattedTime;
    } else {
      var dateTime = DateTime.parse(msgTime.toDate().toString());
      String formattedTime = DateFormat.jm().format(dateTime);
      return formattedTime;
    }
  }
}
