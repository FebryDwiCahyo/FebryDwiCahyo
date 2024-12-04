import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/card_formatters.dart';
import '../utils/card_validator.dart';

class AddCardController extends GetxController {
  final cardHolderName = ''.obs;
  final cardNumber = ''.obs;
  final expiryDate = ''.obs;
  final cvv = ''.obs;
  final isSaveCard = true.obs;

  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cvvController;

  final cardNumberFormatter = CardNumberInputFormatter();
  final expiryDateFormatter = ExpiryDateInputFormatter();
  final cvvFormatter = LengthLimitingTextInputFormatter(3);

  @override
  void onInit() {
    super.onInit();
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void onClose() {
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void updateCardHolderName(String value) => cardHolderName.value = value;
  void updateCardNumber(String value) => cardNumber.value = value;
  void updateExpiryDate(String value) => expiryDate.value = value;
  void updateCvv(String value) => cvv.value = value;
  void toggleSaveCard(bool? value) => isSaveCard.value = value ?? false;

  bool validateCard() {
    if (!CardValidator.validateCardHolderName(cardHolderName.value)) {
      Get.snackbar('Error', 'Please enter a valid card holder name');
      return false;
    }
    if (!CardValidator.validateCardNumber(cardNumber.value)) {
      Get.snackbar('Error', 'Please enter a valid card number');
      return false;
    }
    if (!CardValidator.validateExpiryDate(expiryDate.value)) {
      Get.snackbar('Error', 'Please enter a valid expiry date');
      return false;
    }
    if (!CardValidator.validateCVV(cvv.value)) {
      Get.snackbar('Error', 'Please enter a valid CVV');
      return false;
    }
    return true;
  }

  void onContinuePressed() {
    if (validateCard()) {
      // Process the card
      print('Processing card...');
      // Add your card processing logic here
    }
  }
}
