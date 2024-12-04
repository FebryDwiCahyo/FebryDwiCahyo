import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/paymentmethod_controllers.dart';

class PaymentmethodView extends GetView<PaymentmethodControllers> {
  const PaymentmethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Payment Methods'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildPaymentOptions(), // Build payment options
          const SizedBox(height: 20),
          Obx(() => Text(
              'Selected Payment: ${controller.selectedPaymentMethod.value}',
              style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16), // Add left padding to align the title
            child: Text(
              'Cash',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        _buildPaymentOption('Cash', 'assets/cash.png', 0), // Pass value for the radio button
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16), // Add left padding to align the title
            child: Text(
              'Wallet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        _buildPaymentOption('Wallet', 'assets/wallet.png', 1), // Pass value for the radio button
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16), // Add left padding to align the title
            child: Text(
              'Credit & Debit Card',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        _buildPaymentOption('Add Card', 'assets/card.png', 2, isAddCard: true), // Pass value for the radio button
      ],
    );
  }

  Widget _buildPaymentOption(String method, String imagePath, int value, {bool isAddCard = false}) {
    return GestureDetector(
      onTap: () {
        if (isAddCard) {
          // Navigate to the Add Card page
          Get.toNamed('/payment/method/card');
        } else {
          controller.changePaymentMethod(value);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  method,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Obx(() => Radio(
                    value: value,
                    groupValue: controller.selectedPaymentMethod.value,
                    onChanged: (newValue) {
                      controller.changePaymentMethod(newValue as int);
                    },
                    activeColor: Colors.blue,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
