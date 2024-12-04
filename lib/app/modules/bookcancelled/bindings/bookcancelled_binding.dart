import 'package:get/get.dart';

import '../controllers/bookcancelled_controller.dart';

class BookcancelledBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookcancelledController>(
      () => BookcancelledController(),
    );
  }
}
