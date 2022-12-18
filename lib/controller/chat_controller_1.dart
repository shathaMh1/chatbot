import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// the newest data structor
class ChatContoller1 extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String? message;
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;
  final adminUid = 'vJI1WLlXPucQmbvcpl5zfsAa5W33';

  // Store user message to Firestore
  void storeMessageUser(String msg) async {
    var fireData = await firestore.collection('newChatbot').doc(currentUserID);
    fireData.set({
      'last_message_time': FieldValue.serverTimestamp(),
      'status': 'onHold',
      'user_email': currentUserEmail,
    }).whenComplete(() {
      fireData.collection('messages').doc().set({
        'message': msg,
        'senderID': currentUserID,
        'receiverID': adminUid,
        'time': FieldValue.serverTimestamp(),
      });
    });
  }

  // Store admin message to Firestore
  void storeMessageAdmin(String selectedUserID, String msg) async {
   var fireData = await firestore.collection('newChatbot').doc(selectedUserID);
    
      fireData.collection('messages').doc().set({
        'message': msg,
        'senderID': adminUid,
        'receiverID': selectedUserID,
        'time': FieldValue.serverTimestamp(),
      });
  }

  // Fetching message List from Firestore
  Stream<QuerySnapshot<Object?>> getMessageListByStream() {
    return firestore
        .collection('newChatbot')
        .orderBy('last_message_time', descending: true)
        .snapshots();

  }


  // Fetching message List from Firestore
  Stream<QuerySnapshot<Object?>> getMessageByStream(String docID) {
    return firestore
        .collection('newChatbot')
        .doc(docID)
        .collection('messages')
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
