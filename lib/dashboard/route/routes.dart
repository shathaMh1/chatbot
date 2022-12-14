import 'package:chatbot_template/view/login_screen.dart';
import 'package:get/get.dart';

import '../logic/binding/dashborard_binding.dart';
import '../logic/binding/login_bindings.dart';
import '../view/screen/dashborad_screen.dart';

class AppRoutes {
  static const dashboard = Routes.dashboardScreen;
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      bindings: [
        DashboardBinding(),
        LoginBinding(),
      ],
    ),
  ];
}

class Routes {
  static const dashboardScreen = '/dashboardScreen';
  static const loginScreen = '/loginScreen';
}
