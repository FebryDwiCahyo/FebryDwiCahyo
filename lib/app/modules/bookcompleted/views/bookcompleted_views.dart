import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookcompleted_controller.dart';

class BookcompletedViews extends GetView<BookcompletedController> {
  const BookcompletedViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('My Bookings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: Obx(() => _buildBookingsList()),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem('Upcoming', controller.currentTab.value == 1),
              _buildTabItem('Completed', controller.currentTab.value == 0),
              _buildTabItem('Cancelled', controller.currentTab.value == 2),
            ],
          )),
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (title == 'Upcoming') {
          Get.toNamed('/bookupcoming'); // Ganti dengan rute yang sesuai
        }
        if (title == 'Cancelled') {
          Get.toNamed('/bookcancelled'); // Ganti dengan rute yang sesuai
        } else {
          controller.changeTab(title);
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildBookingsList() {
    return ListView.builder(
      itemCount: controller.bookings.length,
      itemBuilder: (context, index) {
        final booking = controller.bookings[index];
        return _buildBookingItem(
          booking.title,
          booking.price,
          booking.technician,
          booking.imagePath,
        );
      },
    );
  }

  Widget _buildBookingItem(
      String title, String price, String technician, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(price),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 16),
                          const SizedBox(width: 4),
                          Text(technician),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.viewMoreDetails(title),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 36),
              ),
              child: const Text('View More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: 'Location'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.blue,
          onTap: controller.changeNavIndex,
        ));
  }
}
