import 'package:get/get.dart';

import '../controllers/selected_location_controller.dart';

class SelectedLocationBinding extends Bindings {
  @override
   void dependencies() {
    Get.lazyPut(() => SelectedLocationController(Get.arguments));
  }
}
