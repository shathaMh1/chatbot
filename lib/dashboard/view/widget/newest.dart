import 'package:chatbot_template/dashboard/model/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/dashboard_controller.dart';
import 'package:badges/badges.dart';

class NewestChat extends StatelessWidget {
  NewestChat({Key? key}) : super(key: key);

  String date = DateTime.now().toString().changeDateFormat();
  final controller = Get.find<DashboardController>();

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection('users').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                                color: Colors.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(
                                              159, 162, 180, 0.08),
                                          border: Border(
                                            left: BorderSide(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: ListTile(
                                            title: Text(
                                              snapshot.data!
                                                  .docs[index]['user_email']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontFamily: 'Mulish',
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            minLeadingWidth: 11.37,
                                            subtitle: Text(controller
                                                .timestampToDesiredFormat(
                                                    snapshot.data!.docs[index][
                                                        'last_messages_time'])),
                                            leading: const Icon(Icons.face),
                                            trailing: Text(""),
                                            // Badge(
                                            //   elevation: 0,
                                            //   shape: BadgeShape.circle,
                                            //   padding: EdgeInsets.all(7),
                                            //   badgeContent: const Text(
                                            //     "0",
                                            //     style: TextStyle(color: Colors.white),
                                            //   ),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        );
                      }),
                );
        });
  }
}
