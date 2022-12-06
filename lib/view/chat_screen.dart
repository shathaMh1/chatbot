import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/controller/chat_controller.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/timestamp_chat.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

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
                      text: DateFormat.yMMMd().format(DateTime.now()),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: chatController.firestore
                          .collection('messages')
                          .orderBy('time')
                          .snapshots(),
                      builder: (context, snapshot) {
                        List<Widget> chat_messages = [];
                        int index2 = 0;
                        if (!snapshot.hasData) {
                          // display a spinner
                        } else {
                          final messages = snapshot.data!.docs;
                          for (var msg in messages) {
                            final msgText = msg.get('text');
                            final msgSender = msg.get(
                                'sender'); // email of sender can be displayed for later work
                            final msgTime = msg.get('time');
                            final msgWidget = chatController
                                    .isCurrentUser(msgSender)
                                ? UserResponse(
                                    text: msgText,
                                    timeSent: chatController
                                        .timestampToDesiredFormat(msgTime),
                                    widgetColor: Color.fromRGBO(0, 140, 180, 1),
                                  )
                                : AdminResponse(
                                    text: msgText,
                                    // timeSent: DateTime.parse(
                                    //         msgTime.toDate().toString())
                                    //     .toString(),
                                    timeSent: chatController
                                        .timestampToDesiredFormat(msgTime),
                                  );
                            chat_messages.add(msgWidget);

                            print(messages[index2].get(
                                'time')); // trying to get time from Firestore (timestamp)
                            index2 = index2 + 1;
                          }
                        }
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: chat_messages);

                        // return GroupedListView<dynamic, String>(
                        //     elements: chat_messages,
                        //     groupBy: (element) => element['group'],
                        //     groupSeparatorBuilder: (String groupByValue) =>
                        //         Text(groupByValue),
                        //     itemBuilder: (context, dynamic element) =>
                        //         Text(element['name']),
                        //     itemComparator: (item1, item2) => item1['name']
                        //         .compareTo(item2['name']), // optional
                        //     useStickyGroupSeparators: true, // optional
                        //     floatingHeader: true, // optional
                        //     order: GroupedListOrder.ASC); // optional),
                      }),
                ],
              );
            },
          ),
        ),
        InputMsg(iconColor: Color.fromRGBO(0, 140, 180, 1))
      ]),
    );
  }
}
