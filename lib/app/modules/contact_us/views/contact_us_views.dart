import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_us_controllers.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Help Center'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('FAQ'),
                  Text('Contact Us', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 16),
              _buildContactItem(Icons.headset, 'Customer Services'),
              _buildContactItem(Icons.chat, 'WhatsApp', '0871-8941-8411'), // Changed to chat icon
              _buildContactItem(Icons.language, 'Website'),
              _buildContactItem(Icons.facebook, 'Facebook'),
              _buildContactItem(Icons.flutter_dash, 'Twitter'),
              _buildContactItem(Icons.camera_alt, 'Instagram'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, [String? subtitle]) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => controller.onContactItemTap(title),
      ),
    );
  }
}