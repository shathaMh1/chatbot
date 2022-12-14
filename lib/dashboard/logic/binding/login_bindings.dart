import 'package:chatbot_template/controller/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
  }
}
