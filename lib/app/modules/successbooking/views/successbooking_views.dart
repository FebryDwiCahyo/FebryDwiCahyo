import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/successbooking_controller.dart';

class SuccessbookingView extends GetView<SuccessbookingController> {
  const SuccessbookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your Mobile Device Repair Booked.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'You can check your booking on the menu Profile.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/ereceipt');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white, // Set text color to white
                minimumSize: const Size(200, 50),
              ),
              child: const Text('View E-Receipt'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => controller.viewMyBookings(),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                side: const BorderSide(color: Colors.blue),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('View My Bookings'),
            ),
          ],
        ),
      ),
    );
  }
}
