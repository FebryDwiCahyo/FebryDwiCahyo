import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeMerdekaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMerdekaController>(
      () => HomeMerdekaController(),
    );
  }
}
