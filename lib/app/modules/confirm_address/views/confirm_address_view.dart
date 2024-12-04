// File 1: /lib/app/modules/confirm_address/views/confirm_address_view.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/confirm_address_controller.dart';

class ConfirmAddressView extends GetView<ConfirmAddressController> {
  const ConfirmAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Confirm Address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      // Address List Items
                      Obx(() => Column(
                            children: [
                              _buildAddressItem(
                                'Home',
                                'Jl. A. Yani, Surabaya, Indonesia',
                                controller.homeAddressSelected,
                                (value) =>
                                    controller.setHomeAddressSelected(value),
                              ),
                              const SizedBox(height: 11),
                              _buildAddressItem(
                                'Parent\'s House',
                                'Jl. A. Yani, Surabaya, Indonesia',
                                controller.parentsAddressSelected,
                                (value) =>
                                    controller.setParentsAddressSelected(value),
                              ),
                              const SizedBox(height: 11),
                              _buildAddressItem(
                                'Brother House',
                                'Jl. A. Yani, Surabaya, Indonesia',
                                controller.brotherAddressSelected,
                                (value) =>
                                    controller.setBrotherAddressSelected(value),
                              ),
                            ],
                          )),

                      // Add New Address Button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: InkWell(
                          onTap: () => controller.addNewAddress(),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF0083B3),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '+ Add New Delivery Address',
                                style: TextStyle(
                                  color: Color(0xFF0083B3),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Continue Button Container at bottom
            ClipRRect(
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
                        Get.toNamed('/paymentmethod');
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
          ],
        ),
      ),
    );
  }

  Widget _buildAddressItem(String title, String address, RxBool selected,
      Function(bool?) onChanged) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.location_on,
              color: Color(0xFF0083B3),
              size: 24,
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              value: selected.value,
              onChanged: onChanged,
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                address,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
