import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension StringExtensions on String {
  String changeDateFormat({String format = 'hh:mm:ss a'}) {
    String newData = "";
    DateTime dt = DateTime.parse(this);
    DateFormat formatter = DateFormat(format);
    newData = formatter.format(dt);
    return newData;



  }

}