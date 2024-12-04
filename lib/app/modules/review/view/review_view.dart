import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlers/review_controller.dart';

class reviewView extends GetView<reviewController> {
  const reviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Service Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildServiceInfo(),
            _buildStatistics(),
            _buildTabs(),
            _buildServiceList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildServiceInfo() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(controller.serviceImageUrl),
        radius: 30,
      ),
      title: Text(
        controller.serviceName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(controller.serviceSpecialty),
      trailing: const Icon(Icons.verified, color: Colors.blue),
    );
  }

  Widget _buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(Icons.people, '${controller.customerCount}+', 'Customer'),
        _buildStatItem(Icons.work, '${controller.yearsExperience}+', 'Years Exp.'),
        _buildStatItem(Icons.star, controller.rating.toString(), 'Ratings'),
        _buildStatItem(Icons.rate_review, controller.reviewCount.toString(), 'Reviews'),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTabs() {
    return TabBar(
      controller: controller.tabController,
      tabs: const [
        Tab(text: 'Services'),
        Tab(text: 'About'),
        Tab(text: 'Gallery'),
        Tab(text: 'Review'),
      ],
    );
  }

  Widget _buildServiceList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.services.length,
      itemBuilder: (context, index) {
        final service = controller.services[index];
        return ListTile(
          leading: Image.network(service.imageUrl),
          title: Text(service.name),
          subtitle: Text('\$${service.price.toStringAsFixed(2)}'),
          trailing: const Icon(Icons.bookmark_border),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: controller.currentNavIndex.value,
      onTap: controller.changeNavIndex,
    ));
  }
}