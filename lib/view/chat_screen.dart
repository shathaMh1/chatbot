import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Virtual Assistant',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: kBlackColor),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kBlackColor,
          ),
        ),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: const [
          AdminResponse(
            text:
                'helllllllllllllooo  helllllllllllllooo helllllllllllllooo helllllllllllllooo helllllllllllllooo helllllllllllllooo helllllllllllllooo helllllllllllllooo',
          ),
          UserResponse(
            text:
                'Good Morning Sunshine  Good Morning Sunshine Good Morning Sunshine',
          ),
          InputMsg()
        ]),
      ),
    );
  }
}
