import 'package:get/get.dart';
import '../controllers/servicePageConfirmation_controller.dart';

class ServicePageConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicePageConfirmationController>(
      () => ServicePageConfirmationController(),
    );
  }
}