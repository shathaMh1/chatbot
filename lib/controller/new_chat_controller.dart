import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewChatContoller extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String? message;
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;
  final adminUid = 'vJI1WLlXPucQmbvcpl5zfsAa5W33';

  // Store msgs to Firestore
  void storeMessage(String selectedUserID, String msg) async {
    // the following if statement fixes the duplication issue in the admin chat.
    selectedUserID = 'LcgP0tAwTTTcXNiWocFZcNJj3tB3';
    if (currentUserID != adminUid) {
      await firestore
          .collection('users')
          .doc(selectedUserID)
          .collection('messages')
          .doc(adminUid)
          .collection('chats')
          .add({
        "senderID": selectedUserID,
        "receiverID": adminUid,
        "message": msg,
        "time": FieldValue.serverTimestamp(),
      }).then((value) {
        firestore.collection('users').doc(selectedUserID).set({
          "last_messages_time": FieldValue.serverTimestamp(),
          "user_email": currentUserEmail,
          "status": "onHold",
        });
      });
    }

    await firestore
        .collection('users')
        .doc(adminUid)
        .collection('messages')
        .doc(selectedUserID)
        .collection('chats')
        .add({
      "senderID": adminUid, // if it is the admin then it will be admin ID
      "receiverID": selectedUserID, // this must be the selected user ID
      "message": msg,
      "time": FieldValue.serverTimestamp(),
    }).then((value) {
      firestore.collection('users').doc(adminUid).set({
        "last_messages_time": FieldValue.serverTimestamp(),
        "user_email": "admin@gmail.com",
        "status": "onHold",
      });
    });
  }

  // fetching messages from firestore
  Stream<QuerySnapshot<Object?>> getMessageByStream() {
    print(currentUserID);
    print(adminUid);
    return firestore
        .collection('users')
        .doc(currentUserID)
        .collection('messages')
        .doc(adminUid)
        .collection('chats')
        .orderBy('time', descending: true)
        .snapshots();
  }

  //Check if it's the current user returns true
  bool isCurrentUser(msgSenderID) {
    if (currentUserID == msgSenderID) {
      return true;
    }
    return false;
  }

  // Time converter
  String timestampToDesiredFormat(msgTime) {
    if (msgTime == null) {
      String formattedTime = DateFormat.jm().format(DateTime.now());
      return formattedTime;
    } else {
      var dateTime = DateTime.parse(msgTime.toDate().toString());
      String formattedTime = DateFormat.jm().format(dateTime);
      return formattedTime;
    }
  }
}
