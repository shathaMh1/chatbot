import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
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
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.5),
                    child: TimeStampChat(
                      text: 'Today 12:00 PM',
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        UserResponse(
                          text:
                              'Hello, I\'m looking for exchanging  some of the items I bought yesterday! ',
                        ),
                        AdminResponse(
                          text:
                              'Welcome to our customer services. Just a moment one of our assistants will be in touch with you shortly.',
                        ),
                        UserResponse(
                          text: 'Okay',
                        ),
                        UserResponse(
                          text: 'I\'m busy please hurry up!!!',
                        ),
                        AdminResponse(
                          text:
                              '(Hawra): Hello, I see that you want to exchange some of the items. Do you have your receipt?',
                        ),
                        UserResponse(
                          text:
                              'No, I think I have lost it. Is there a way to exchange without it?',
                        ),
                      ]),
                ],
              );
            },
          ),
        ),
        const InputMsg()
      ]),
    );
  }
}
