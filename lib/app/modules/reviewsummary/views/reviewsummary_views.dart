import 'dart:ui'; // Import for ImageFilter

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reviewsummary_controller.dart';

class ReviewsummaryView extends GetView<ReviewsummaryController> {
  const ReviewsummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          _buildServiceInfo(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Booking Date', controller.bookingDate),
                    _buildInfoRow('Customer', controller.customerName),
                    const SizedBox(height: 20),
                    _buildAmountSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
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
                  Get.toNamed('/successbooking');
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
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        _buildInfoRow('Amount', '\$${controller.amount}'),
        _buildInfoRow('Tax & Fees', '\$${controller.taxAndFees}'),
        const Divider(),
        _buildInfoRow('Total', '\$${controller.total}'),
      ],
    );
  }

  Widget _buildServiceInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/repair1.jpg', // Adjust path to match your image file
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.serviceName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text(controller.serviceProvider),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(controller.serviceRating),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
