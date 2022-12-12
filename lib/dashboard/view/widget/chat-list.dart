import 'package:chatbot_template/dashboard/view/widget/newest.dart';
import 'package:chatbot_template/dashboard/view/widget/oldest.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: SizedBox(
          width: 1260,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 284, top: 246, right: 682, bottom: 17),
              child: Card(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      bottom: const TabBar(
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(
                          fontFamily: 'Mulish',
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        tabs: [
                          Tab(text: 'Newest(0)'),
                          Tab(text: 'Oldest(0)'),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      NewestChat(),
                      OldestChat(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
