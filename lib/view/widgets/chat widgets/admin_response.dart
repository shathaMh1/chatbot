import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
import 'package:flutter/material.dart';

class AdminResponse extends StatelessWidget {
  final String text;
  final String timeSent;

  const AdminResponse({
    this.text = 'default text',
    this.timeSent = '00:00 AM',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, bottom: 8, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
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
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: TimeStampChat(text: timeSent),
          ),
        ],
      ),
    );
  }
}
