import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/mark_close_button.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

class AdminChatWidget extends StatelessWidget {
  AdminChatWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc("vJI1WLlXPucQmbvcpl5zfsAa5W33")
                  .collection('messages')
                  .doc("vJI1WLlXPucQmbvcpl5zfsAa5W33")
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
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Text("h");
                    },
                  );
                }
                return Container();
              })),
      InputMsg(
        iconColor: Color.fromRGBO(177, 193, 207, 1),
      )
    ]);
  }
}
