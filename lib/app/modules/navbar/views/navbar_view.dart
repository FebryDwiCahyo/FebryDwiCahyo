import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.find();

    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: controller.selectedIndex.value, // Observe the selected index
          selectedItemColor: const Color(0xFF0093B7),
          unselectedItemColor: Colors.black,
          onTap: (index) => controller.onItemTapped(index), // Handle tap
        ));
  }
}
