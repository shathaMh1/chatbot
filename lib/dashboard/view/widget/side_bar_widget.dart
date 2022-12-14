import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../logic/controllers/dashboard_controller.dart';
import '../screen/dashborad_screen.dart';

class SideBarWidget extends StatelessWidget {
  SideBarWidget({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 250,
            color: Color.fromRGBO(54, 55, 64, 1),
            child: Column(
              children: [
                SizedBox(
                  height: 124,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    NavItem(
                      image: 'icons/overview.svg',
                      title: controller.sideNav[0],
                      controller: controller,
                    ),
                    NavItem(
                      image: 'icons/check.svg',
                      title: controller.sideNav[1],
                      controller: controller,
                    ),
                    NavItem(
                      image: 'icons/closed.svg',
                      title: controller.sideNav[2],
                      controller: controller,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container NavItem({
    required String image,
    required String title,
    required DashboardController controller,
  }) {
    return Container(
      decoration: controller.selected == title
          ? BoxDecoration(
              color: Color.fromRGBO(159, 162, 180, 0.08),
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.only(left: 54),
        child: ListTile(
          leading: SvgPicture.asset(
            image,
            height: 13.3,
            width: 13.3,
            color: controller.selected == title
                ? Colors.white
                : Color.fromRGBO(164, 166, 179, 1),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: controller.selected == title
                    ? Colors.white
                    : Color.fromARGB(255, 179, 170, 164),
                fontSize: 16),
          ),
          minLeadingWidth: 11.37,
          onTap: () {
            controller.checkSelected(title);
            // Get.to(DashboardScreen());
          },
        ),
      ),
    );
  }
}
