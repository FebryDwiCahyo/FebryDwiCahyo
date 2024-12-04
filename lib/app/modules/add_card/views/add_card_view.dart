import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/add_card_controller.dart';
import '../widgets/credit_card_widget.dart';

class AddCardView extends GetView<AddCardController> {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Add Card',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Inter',
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Credit Card Preview
                Obx(() => CreditCardWidget(
                      cardNumber: controller.cardNumber.value,
                      cardHolderName: controller.cardHolderName.value,
                      expiryDate: controller.expiryDate.value,
                      cvv: controller.cvv.value,
                    )),
                const SizedBox(height: 20),

                // Card Holder Name Field
                const Text(
                  'Card Holder Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  controller: controller.cardHolderNameController,
                  hint: 'Enter Card Holder Name',
                  onChanged: controller.updateCardHolderName,
                ),
                const SizedBox(height: 20),

                // Card Number Field
                const Text(
                  'Card Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  controller: controller.cardNumberController,
                  hint: 'Enter Card Number',
                  onChanged: controller.updateCardNumber,
                  inputFormatters: [controller.cardNumberFormatter],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // Expiry Date and CVV
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expiry Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildTextField(
                            controller: controller.expiryDateController,
                            hint: 'MM/YY',
                            onChanged: controller.updateExpiryDate,
                            inputFormatters: [controller.expiryDateFormatter],
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CVV',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildTextField(
                            controller: controller.cvvController,
                            hint: 'Enter CVV',
                            onChanged: controller.updateCvv,
                            inputFormatters: [controller.cvvFormatter],
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Save Card Checkbox
                Row(
                  children: [
                    Obx(() => Checkbox(
                          value: controller.isSaveCard.value,
                          onChanged: controller.toggleSaveCard,
                          activeColor: const Color(0xFF0083B3),
                        )),
                    const Text(
                      'Save Card',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/reviewsummary');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0083B3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required Function(String) onChanged,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD7D6D6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD7D6D6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF0083B3)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
