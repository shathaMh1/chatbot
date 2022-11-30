import 'package:flutter/material.dart';

class AdminResponse extends StatelessWidget {
  final String text;

  const AdminResponse({
    this.text = 'default text',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, bottom: 8, top: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(232, 236, 239, 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
