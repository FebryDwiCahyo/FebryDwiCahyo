import 'package:get/get.dart';
import '../controllers/servicePage_controller.dart';

class ServicePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicePageController>(
      () => ServicePageController(),
    );
  }
}
