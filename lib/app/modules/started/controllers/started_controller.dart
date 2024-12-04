import 'package:get/get.dart';

class StartedController extends GetxController {
  // Predefined credentials for login
   // Function to navigate to the next screen
  void goToHome() {
    Get.toNamed('/login');
  }

  void goToSignIn() {
    Get.toNamed('/login');
  }
}
