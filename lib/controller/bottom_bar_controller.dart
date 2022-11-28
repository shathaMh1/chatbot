import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int currentIndex = 3;

  void selectedPage(index) {
    currentIndex = index;
    update();
  }
}
