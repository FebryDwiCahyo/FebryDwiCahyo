import 'package:get/get.dart';
import '../controllers/faqcontrolers.dart';

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController());
  }
}