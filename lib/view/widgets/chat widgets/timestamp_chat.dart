import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeStampChat extends StatelessWidget {
  String text = '';
  TimeStampChat({
    this.text = '00:00 AM',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromRGBO(114, 114, 114, 1),
          fontWeight: FontWeight.w500,
          fontSize: 11),
    );
  }
}
