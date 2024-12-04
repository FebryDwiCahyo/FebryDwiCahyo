import 'package:get/get.dart';
import '../controllers/paymentmethod_controllers.dart';

class PaymentmethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentmethodControllers>(() => PaymentmethodControllers());
  }
}
