import 'package:dashboard/logic/binding/dashborard_binding.dart';
import 'package:get/get.dart';

import '../view/screen/dashborad_screen.dart';

class AppRoutes {
  static const dashboard = Routes.dashboardScreen;

  static final routes = [
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}

class Routes {
  static const dashboardScreen = '/dashboardScreen';
}
