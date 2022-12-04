import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/controller/chat_controller.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final chatController = Get.put(ChatContoller());
  ChatScreen({super.key});

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
                  StreamBuilder<QuerySnapshot>(
                      stream: chatController.firestore
                          .collection('messages')
                          .orderBy('time')
                          .snapshots(),
                      builder: (context, snapshot) {
                        List<Widget> chat_messages = [];

                        if (!snapshot.hasData) {
                          // display a spinner
                        } else {
                          final messages = snapshot.data!.docs;
                          for (var msg in messages) {
                            final msgText = msg.get('text');
                            final msgSender = msg.get(
                                'sender'); // email of sender can be displayed for later work
                            final msgTime = msg.get('time');
                            

                            final msgWidget =
                                chatController.isCurrentUser(msgSender)
                                    ? UserResponse(
                                        text: msgText,
                                        timeSent: chatController.timestampToDesiredFormat(msgTime),
                                      )
                                    : AdminResponse(
                                        text: msgText,
                                        // timeSent: DateTime.parse(
                                        //         msgTime.toDate().toString())
                                        //     .toString(),
                                        timeSent: chatController.timestampToDesiredFormat(
                                            msgTime),
                                      );
                            chat_messages.add(msgWidget);
                          }
                        }
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: chat_messages);
                      }),
                ],
              );
            },
          ),
        ),
        InputMsg()
      ]),
    );
  }
}
