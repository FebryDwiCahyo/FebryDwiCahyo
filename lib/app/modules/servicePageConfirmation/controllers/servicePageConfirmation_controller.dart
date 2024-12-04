import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePageConfirmationController extends GetxController {
  final TextEditingController noteController = TextEditingController();
  final RxInt selectedDateIndex = 0.obs;
  final RxInt selectedTimeIndex = 0.obs;

  void selectDate(int index) {
    selectedDateIndex.value = index;
  }

  void selectTime(int index) {
    selectedTimeIndex.value = index;
  }

  void onContinuePressed() {
    // Implement booking confirmation logic
    Get.toNamed('/booking-confirmation');
  }

  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }
}