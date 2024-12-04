import 'package:get/get.dart';

import '../controllers/popular_service__controller.dart';

class PopularServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularServiceController>(
      () => PopularServiceController(),
    );
  }
}
