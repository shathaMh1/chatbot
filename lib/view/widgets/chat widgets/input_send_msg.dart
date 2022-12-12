import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/controller/chat_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InputMsg extends StatelessWidget {
  final chatController = Get.put(ChatContoller());
  final messageEditingController = TextEditingController();
  final Color iconColor;

  InputMsg({
    this.iconColor = Colors.grey,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: Color.fromRGBO(243, 244, 246, 1))),
        ),
        child: TextField(
            controller: messageEditingController,
            onChanged: (value) {
              chatController.message = value;
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(color: kBlackColor),
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: 'Write a message',
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(51, 71, 91, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/SendMsg.svg',
                    color: iconColor,
                    width: 18,
                    height: 18,
                    fit: BoxFit.scaleDown,
                  ),
                  onPressed: () async {
                    messageEditingController.clear();
                    chatController.getUserMessages();
                  
                    print('sending msg to Firestore Database ..');
                  },
                ))),
      ),
    );
  }
}
