import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class ChatContoller extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String? message;
  final currentUser = FirebaseAuth.instance.currentUser!.email;
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;
  final adminUid = 'vJI1WLlXPucQmbvcpl5zfsAa5W33';
  final chatID = ''.obs;

  //to get messages from Firestore Database
  void getMessagesByStreams() async {
    var snapshots = firestore.collection('messages').snapshots();
    await for (var snapshot in snapshots) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }

  void getUserMessages() async {
    var snapshots = firestore.collection('chatbot3').snapshots();
    var chatbotDoc = firestore.collection('chatbot3').doc();
    await for (var snapshot in snapshots) {
      print(snapshot.docs.length);
      if (snapshot.docs.isEmpty) {
        chatbotDoc.set({'id': chatbotDoc.id, 'userID': currentUserID});
        chatbotDoc.collection('messages').add({
          'text': message,
          'sender':
              currentUserID, //maybe the issue from here UserUID is needed.
          'receiver': adminUid,
          'time': FieldValue.serverTimestamp(),
        });
      } else {
        for (var userId in snapshot.docs) {
          print(userId.data().length);
          // duplicated msgs
          if (userId.data()['userID'] == currentUserID) {
            firestore
                .collection('chatbot3')
                .doc(userId.data()['id'])
                .collection('messages')
                .add({
              'text': message,
              'sender':
                  currentUserID, //maybe the issue from here UserUID is needed.
              'receiver': adminUid,
              'time': FieldValue.serverTimestamp(),
            });
          } else {
            chatbotDoc.set({'id': chatbotDoc.id, 'userID': currentUserID});
            chatbotDoc.collection('messages').add({
              'text': message,
              'sender':
                  currentUserID, //maybe the issue from here UserUID is needed.
              'receiver': adminUid,
              'time': FieldValue.serverTimestamp(),
            });
          }
          print("else: ${userId.data()['userID']}");
        }
      }
    }

    // var snapshots = firestore.collection('chatbot').snapshots();
    // var chatbotDoc = firestore.collection('chatbot').doc();
    // await for (var snapshot in snapshots) {
    //   if (snapshot.docs.isEmpty) {
    //     chatbotDoc.set({'id': chatbotDoc.id, 'userID': currentUserID});
    //     chatbotDoc.collection('messages').add({
    //       'text': message,
    //       'sender':
    //           currentUserID, //maybe the issue from here UserUID is needed.
    //       'receiver': adminUid,
    //       'time': FieldValue.serverTimestamp(),
    //     });
    //   } else {
    //     for (var userId in snapshot.docs) {
    //       // duplicated msgs
    //       if (userId.data()['userID'] == currentUserID) {
    //         firestore
    //             .collection('chatbot')
    //             .doc(userId.data()['id'])
    //             .collection('messages')
    //             .add({
    //           'text': message,
    //           'sender':
    //               currentUserID, //maybe the issue from here UserUID is needed.
    //           'receiver': adminUid,
    //           'time': FieldValue.serverTimestamp(),
    //         });
    //       } else {
    //         chatbotDoc.set({'id': chatbotDoc.id, 'userID': currentUserID});
    //         chatbotDoc.collection('messages').add({
    //           'text': message,
    //           'sender':
    //               currentUserID, //maybe the issue from here UserUID is needed.
    //           'receiver': adminUid,
    //           'time': FieldValue.serverTimestamp(),
    //         });
    //       }
    //       print("else: ${userId.data()['userID']}");
    //     }
    //   }
    // }
  }

  // void getChatID(String currentUserID) async {
  //   final snapshot = await firestore.collection('chatbot3').get().then((s) {
  //     if (s.docs.first['userID'] == currentUserID) {
  //       chatID.value = s.docs.first['id'];
  //     }
  //   });
  // }

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
