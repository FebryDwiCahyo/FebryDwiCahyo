import 'package:get/get.dart';
import '../controllers/about_Controller.dart';
import 'package:flutter/material.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Service Provider'),
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
            _buildProfileHeader(),
            _buildStatistics(),
            _buildTabBar(),
            _buildAboutSection(),
            _buildServiceProvider(),
            _buildWorkingHours(),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(controller.profileImageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(controller.profession),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.blue),
                    Text(controller.location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('${controller.customerCount}+', 'Customer'),
        _buildStatItem('${controller.experienceYears}+', 'Years Exp.'),
        _buildStatItem(controller.rating.toString(), 'Ratings'),
        _buildStatItem(controller.reviewCount.toString(), 'Reviews'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTabBar() {
    return const DefaultTabController(
      length: 4,
      child: TabBar(
        tabs: [
          Tab(text: 'Services'),
          Tab(text: 'About'),
          Tab(text: 'Gallery'),
          Tab(text: 'Review'),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About Service',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(controller.aboutService),
          TextButton(
            onPressed: () {
              // Implement read more functionality
            },
            child: const Text('Read more'),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceProvider() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(controller.profileImageUrl),
      ),
      title: Text(controller.name),
      subtitle: const Text('Service Provider'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
          IconButton(icon: const Icon(Icons.phone), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildWorkingHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Working Hours',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ...controller.workingHours.entries.map((entry) => ListTile(
              title: Text(entry.key),
              trailing: Text(entry.value),
            )),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'Location'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
