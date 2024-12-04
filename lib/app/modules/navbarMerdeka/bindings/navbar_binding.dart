import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class NavbarMerdekaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarMerdekaController>(() => NavbarMerdekaController());
  }
}
