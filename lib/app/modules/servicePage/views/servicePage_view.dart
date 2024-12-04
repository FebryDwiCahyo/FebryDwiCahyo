import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controllers/servicePage_controller.dart';

class ServicePageView extends GetView<ServicePageController> {
  const ServicePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildHeaderImage(),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () => Get.back(),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.share_outlined),
                      color: Colors.white,
                      onPressed: controller.onSharePressed,
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_border_rounded),
                      color: Colors.white,
                      onPressed: controller.onBookmarkPressed,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: _buildServiceDetails(context),
                ),
                SliverToBoxAdapter(
                  child: _buildTabBarSection(context),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Image.network(
      'https://picsum.photos/seed/830/600',
      width: double.infinity,
      height: 300.0,
      fit: BoxFit.cover,
    );
  }

  Widget _buildServiceDetails(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Device Service',
                    style: TextStyle(
                      fontFamily: 'Inter',
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() => RatingBar.builder(
                            onRatingUpdate: controller.onRatingChanged,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            initialRating: controller.rating.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 24.0,
                            allowHalfRating: true,
                          )),
                      Obx(() => Text(
                            '${controller.rating.value}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Laptop Repair',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jl. Dharmahusada Indah Timur, Surabaya, Indonesia',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: controller.tabController,
            labelColor: const Color(0xFF0083B3),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Gallery'),
              Tab(text: 'Review'),
            ],
          ),
          SizedBox(
            height: 400.0, // Increased height to accommodate content
            child: TabBarView(
              controller: controller.tabController,
              children: [
                _buildAboutTab(),
                _buildGalleryTab(),
                _buildReviewTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Service',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud Read more',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildServiceProvider(),
        ],
      ),
    );
  }

  Widget _buildServiceProvider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Service Provider',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.network(
                'https://picsum.photos/seed/751/600',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bob',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Service Provider',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_bubble_rounded),
                  color: const Color(0xFF0083B3),
                  onPressed: () {
                    Get.toNamed('/chat');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.call_rounded),
                  color: const Color(0xFF0083B3),
                  onPressed: () {
                    Get.toNamed('/call');
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGalleryTab() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Gallery (25)',
                style: TextStyle(
                  fontFamily: 'Inter Tight',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/gallery');
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF0083B3),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/seed/${400 + index}/600',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search in reviews',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.verified),
                    label: const Text('Verified'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.update),
                    label: const Text('Latest'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo),
                    label: const Text('With Photos'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                    label: const Text('Rating Only'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/seed/751/600'),
                          radius: 20,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rick Astley',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2 months ago',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Text('4.9',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: const Alignment(0.0, 1.0),
        child: Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.black26,
                offset: Offset(0.0, -2.0),
              )
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      '\$15.00',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/service/page/confirmation');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0083B3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter Tight',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
