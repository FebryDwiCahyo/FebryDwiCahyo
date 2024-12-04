import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';


class GalleryView extends GetView<GalleryController> {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Photo Gallery'),
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
            _buildGalleryInfo(),
            _buildStatistics(),
            _buildTabs(),
            _buildPhotoGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildGalleryInfo() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(controller.galleryImageUrl),
        radius: 30,
      ),
      title: Text(
        controller.galleryName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(controller.galleryDescription),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.blue),
              Text(controller.galleryLocation),
            ],
          ),
        ],
      ),
      trailing: const Icon(Icons.verified, color: Colors.blue),
    );
  }

  Widget _buildStatistics() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(Icons.photo_library, '${controller.photoCount}+', 'Photos'),
          _buildStatItem(Icons.remove_red_eye, '${controller.viewCount}+', 'Views'),
          _buildStatItem(Icons.star, controller.rating.toString(), 'Rating'),
          _buildStatItem(Icons.favorite, controller.likeCount.toString(), 'Likes'),
        ],
      ),
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
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Nature'),
        Tab(text: 'Urban'),
        Tab(text: 'People'),
      ],
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: controller.photos.length,
      itemBuilder: (context, index) {
        final photo = controller.photos[index];
        return Image.network(photo.imageUrl, fit: BoxFit.cover);
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Likes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: controller.currentNavIndex.value,
      onTap: controller.changeNavIndex,
    ));
  }
}