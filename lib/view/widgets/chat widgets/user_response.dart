import 'package:flutter/material.dart';

class UserResponse extends StatelessWidget {
  final String text;

  const UserResponse({
    this.text = 'default text',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, bottom: 15, top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 140, 180, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
          child: Text(text, style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}