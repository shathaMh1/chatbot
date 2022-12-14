import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminChatWidget extends StatelessWidget {
  final String docID;
  AdminChatWidget({super.key, required this.docID});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Text(
                          snapshot.data!.docs[index]['message'].toString());
                    },
                  );
                }
                return Container();
              })),
    ]);
  }
}
