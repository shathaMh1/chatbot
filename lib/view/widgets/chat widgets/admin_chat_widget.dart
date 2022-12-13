import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/controller/chat_controller.dart';
import 'package:chatbot_template/controller/new_chat_controller.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/mark_close_button.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

class AdminChatWidget extends StatelessWidget {
  final chatController = Get.put(NewChatContoller());
  var userUid = FirebaseAuth.instance.currentUser!.uid;
  AdminChatWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          actions: [MarkClosedButton()],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(54, 55, 64, 1),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: chatController.getMessageByStream(),
                builder: (context, snapshot) {
                  List<Widget> chatMessages = [];

                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length < 1) {
                      return Container();
                    }

                    return ListView.builder(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final msgWidget = chatController.isCurrentUser(
                                snapshot.data!.docs[index]['senderID'])
                            ? UserResponse(
                                text: snapshot.data!.docs[index]['message'],
                                timeSent:
                                    chatController.timestampToDesiredFormat(
                                        snapshot.data!.docs[index]['time']),
                                widgetColor:
                                    const Color.fromRGBO(54, 55, 64, 1),
                              )
                            : AdminResponse(
                                text: snapshot.data!.docs[index]['message'],
                                timeSent:
                                    chatController.timestampToDesiredFormat(
                                        snapshot.data!.docs[index]['time']),
                              );
                        chatMessages.add(msgWidget);
                        return msgWidget;
                      },
                    );
                  }
                  return Container();
                })),
        InputMsg(
          iconColor: Color.fromRGBO(177, 193, 207, 1),
        )
      ]),
    );
  }
}
