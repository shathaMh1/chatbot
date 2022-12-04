import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
    try {
      String hour = DateTime.parse(msgTime.toDate().toString()).hour.toString();
      int hourInteger = int.parse(hour);
      String minutes =
          DateTime.parse(msgTime.toDate().toString()).minute.toString();
      String? timeOfDay = '';
      if (hourInteger < 12 && hourInteger >= 0) {
        timeOfDay = 'AM';
      } else {
        hourInteger = hourInteger - 12;
        timeOfDay = 'PM';
      }
      String formatTime = '$hourInteger:$minutes $timeOfDay';
      return formatTime;
    } catch (e) {
      return e.toString();
    }
  }
}
