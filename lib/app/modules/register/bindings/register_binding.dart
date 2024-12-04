import 'package:get/get.dart';
import 'package:reparin_mobile/app/data/services/authentication/controllers/authentication_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(),
    );
  }
}
