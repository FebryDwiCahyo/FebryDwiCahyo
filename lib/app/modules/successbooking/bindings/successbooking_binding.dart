import 'package:get/get.dart';
import '../controllers/successbooking_controller.dart';

class SuccessbookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessbookingController>(() => SuccessbookingController());
  }
}
