import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reparin_mobile/app/modules/maps/controllers/maps_controller.dart';


class MapsView extends StatelessWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapsController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'GEO Maps',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[600], // Warna biru utama
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue[800], // Warna biru lebih gelap
                ),
              ),
              const SizedBox(height: 24),
              _buildFeatureButton(
                label: 'Current Location',
                icon: Icons.location_on,
                color: Colors.blue,
                onTap: controller.getCurrentLocation,
              ),
              const SizedBox(height: 16),
              _buildLocationDetails(controller),
              const SizedBox(height: 16),
              _buildFeatureButton(
                label: 'Open Maps',
                icon: Icons.map,
                color: Colors.lightBlue,
                onTap: controller.openGoogleMaps,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDetails(MapsController controller) {
    return Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800], // Warna biru lebih gelap
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.locationMessage.value,
                style: TextStyle(color: Colors.blue[900]),
              ),
              const SizedBox(height: 10),
              if (controller.loading.value)
                Center(child: CircularProgressIndicator(color: Colors.blue)),
            ],
          ),
        ));
  }
}
