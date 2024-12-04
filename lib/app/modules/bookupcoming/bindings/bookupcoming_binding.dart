import 'package:get/get.dart';

import '../controllers/bookupcoming_controller.dart';

class BookupcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookupcomingController()); // Using Get.put instead of lazyPut
  }
}