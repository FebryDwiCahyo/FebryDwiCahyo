// Update pada file: /lib/app/modules/home/views/home_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../webview/controllers/webview_controller.dart';
import '../../webview/views/webview_reparin.dart';
import '../controllers/home_controller.dart';
import 'package:reparin_mobile/app/modules/navbar/views/navbar_view.dart'; // Assuming the custom navigation bar exists

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0093B7),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.newspaper_outlined),
            onPressed: () {
              Get.to(
                () => const HelpWebViewReparin(),
                binding: BindingsBuilder(() {
                  Get.put(ArticleDetailController()); // Bind the controller here
                }),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Get.toNamed('/notification'); // Navigate to notification page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Sticky "Find nearby services" section
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF0093B7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find nearby services . . .',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Scrollable content from "Categories" to "Popular Services"
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(
                                'category'); // Navigate to Category page
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard('Laptop', Icons.laptop_mac),
                        _buildCategoryCard('Handphone', Icons.phone_android),
                        _buildCategoryCard('Tablet', Icons.tablet_mac),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Popular Services section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(
                                '/popular-service'); // Navigate to Popular Service page
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Obx(() {
                      return GridView.builder(
                        physics:
                            const NeverScrollableScrollPhysics(), // Prevent grid from scrolling independently
                        shrinkWrap:
                            true, // Shrink the grid to fit in the column
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: controller.services.length,
                        itemBuilder: (context, index) {
                          var service = controller.services[index];
                          return _buildServiceCard(service);
                        },
                      );
                    }),
                  ),
                  
                  // Tambahkan tombol "View News" di bagian paling bawah
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/news'); // Navigate to news page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0093B7), // Warna tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Center(
                        child: Text(
                          'View News',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // Spacing di bawah tombol
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Custom bottom navigation bar
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFE5F6FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            size: 40,
            color: const Color(0xFF0093B7),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
            '/popular-service'); // Navigate to Popular Service page on image tap
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE5F6FA),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  service['image'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              service['price'],
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
            Text(
              service['provider'],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
