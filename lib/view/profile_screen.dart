import 'package:flutter/material.dart';

import 'widgets/chat widgets/admin_chat_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdminChatWidget(),
    );
  }
}
