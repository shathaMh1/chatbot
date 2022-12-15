import 'package:chatbot_template/view/widgets/chat%20widgets/admin_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/chat_screen.dart';
import '../../logic/controllers/dashboard_controller.dart';
import '../widget/appbar_widget.dart';
import '../widget/chat-list.dart';
import '../widget/side_bar_widget.dart';
import '../widget/user-profile.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: CircularProgressIndicator()),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBarWidget(),
                AppBarWidget(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatList(),
              UserProfile(),
            ],
          ),
         
        ],
      ),
    );
  }
}

// my layout design to dashboard! didn't workout. 

// Scaffold(
//         body: Row(
//       children: [
//         SideBarWidget(),
//         Column(
//           children: [
//             AppBarWidget(),
//             Row(
//               children: const [
//                 ChatList(),
//                 AdminChat(),
//               ],
//             )
//           ],
//         ),
//         const UserProfile(),
//       ],
//     ));