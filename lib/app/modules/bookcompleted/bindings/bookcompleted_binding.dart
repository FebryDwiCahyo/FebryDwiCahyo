import 'package:get/get.dart';

import '../controllers/bookcompleted_controller.dart';

class BookcompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookcompletedController>(
      () => BookcompletedController(),
    );
  }
}
