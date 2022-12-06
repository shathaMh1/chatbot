import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class ChatContoller extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String? message;
  final currentUser = FirebaseAuth.instance.currentUser!.email;

  //to get messages from Firestore Database

  void getMessagesByStreams() async {
    var snapshots = firestore.collection('messages').snapshots();
    await for (var snapshot in snapshots) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }



  //check if it's the current user returns true
  bool isCurrentUser(msgSender) {
    if (currentUser == msgSender) {
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
