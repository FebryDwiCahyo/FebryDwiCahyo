import 'package:get/get.dart';
import '../controlers/review_controller.dart';

class reviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<reviewController>(() => reviewController());
  }
}