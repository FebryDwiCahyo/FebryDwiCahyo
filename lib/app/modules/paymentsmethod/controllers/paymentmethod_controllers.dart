import 'package:get/get.dart';

class PaymentmethodControllers extends GetxController {
  var selectedPaymentMethod = 0.obs; // Default value is 0 (Cash)

  void changePaymentMethod(int value) {
    selectedPaymentMethod.value = value;
  }
}
