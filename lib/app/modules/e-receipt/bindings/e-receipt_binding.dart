import 'package:get/get.dart';
import '../controllers/e-receipt_controller.dart';

class EreceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EreceiptController());
  }
}
