import 'package:get/get.dart';
import '../controllers/contact_us_controllers.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());
  }
}