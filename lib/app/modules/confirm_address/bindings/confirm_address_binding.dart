// File 3: /lib/app/modules/confirm_address/bindings/confirm_address_binding.dart
import 'package:get/get.dart';
import '../controllers/confirm_address_controller.dart';

class ConfirmAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmAddressController>(
      () => ConfirmAddressController(),
    );
  }
}