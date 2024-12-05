import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../webview/controllers/webview_controller.dart';
import '../../webview/views/webview_ifixit.dart';
import '../controllers/faqcontrolers.dart';
import 'package:url_launcher/url_launcher.dart'; 

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.toNamed('/profile'),
        ),
        title: const Text('Help Center'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('FAQ', style: TextStyle(color: Colors.blue)),
              Text('Contact Us'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryButton('All'),
              _buildCategoryButton('Service'),
              _buildCategoryButton('General'),
              _buildCategoryButton('Account'),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.faqItems.length,
              itemBuilder: (context, index) {
                final item = controller.faqItems[index];
                return item.question == 'Need more help?'
                    ? _buildHelpTile()
                    : _buildExpandableTile(item.question, item.answer);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Obx(() => ElevatedButton(
      onPressed: () => controller.setCategory(category),
      style: ElevatedButton.styleFrom(
        backgroundColor: controller.selectedCategory.value == category 
            ? Colors.blue 
            : Colors.grey[300],
        foregroundColor: controller.selectedCategory.value == category 
            ? Colors.white 
            : Colors.black,
      ),
      child: Text(category),
    ));
  }

  Widget _buildExpandableTile(String title, String content) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content),
        ),
      ],
    );
  }

  // Special ExpansionTile for the "Need more help?" FAQ
  Widget _buildHelpTile() {
    return ExpansionTile(
      title: const Text('Need more help?'),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // iFixit WebView Button
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const HelpWebViewIfixit(),
                    binding: BindingsBuilder(() {
                      Get.put(ArticleDetailController());
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.help_outline, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Visit iFixit Page',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () async {
                  final String googleMapsUrl = 
                      'https://maps.app.goo.gl/36Zt2vBfdpZrY3R6A'; 
                  
                  try {
                    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
                      await launchUrl(
                        Uri.parse(googleMapsUrl),
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      // Fallback for devices without Google Maps
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        const SnackBar(content: Text('Could not open Google Maps')),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(Get.context!).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Different color to distinguish from iFixit button
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.map_outlined, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Find Our Office',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}