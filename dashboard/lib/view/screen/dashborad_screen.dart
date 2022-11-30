import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/appbar_widget.dart';
import '../widget/side_bar_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBarWidget(),
          AppBarWidget(),
        ],
      ),
    );
  }
}
