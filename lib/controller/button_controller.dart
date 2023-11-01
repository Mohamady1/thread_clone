import 'package:get/get.dart';

class ButtonController extends GetxController {
  bool showScrollToTopButton = false;

  void toggleButtonVisible() {
    showScrollToTopButton = !showScrollToTopButton;
    update();
  }
}
