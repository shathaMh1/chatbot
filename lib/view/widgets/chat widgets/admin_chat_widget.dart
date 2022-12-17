import 'package:chatbot_template/controller/new_chat_controller.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/mark_close_button.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminChatWidget extends StatelessWidget {
  final String docID;
  final chatController = Get.put(NewChatContoller());
  //var userUid = FirebaseAuth.instance.currentUser!.uid;

  AdminChatWidget({super.key, required this.docID});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          color: const Color.fromRGBO(54, 55, 64, 1),
          height: 40,
          child: const MarkClosedButton(),
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc("vJI1WLlXPucQmbvcpl5zfsAa5W33")
                    .collection('messages')
                    .doc(docID)
                    .collection('chats')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot.data!.docs.length);
                  List<Widget> chatMessages = [];
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length < 1) {
                      return Container();
                    }
                    return ListView.builder(
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
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
        InputMsg()
      ]),
    );
  }
}
