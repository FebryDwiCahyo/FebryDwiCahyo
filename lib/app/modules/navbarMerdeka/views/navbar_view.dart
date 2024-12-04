import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class CustomBottomNavigationBarMerdeka extends StatelessWidget {
  const CustomBottomNavigationBarMerdeka({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarMerdekaController controller = Get.find();

    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: 'Location'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex:
              controller.selectedIndex.value, // Observe the selected index
          selectedItemColor: const Color.fromARGB(255, 89, 16, 16), // Dark red color
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xFFD32F2F), // Red background color
          onTap: (index) => controller.onItemTapped(index), // Handle tap
          type: BottomNavigationBarType.fixed, // Ensures all icons are visible
        ));
  }
}
