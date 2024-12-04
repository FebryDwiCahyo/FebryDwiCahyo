import 'package:get/get.dart';

class PopularServiceController extends GetxController {
  // List of popular services with location data
  var serviceList = <Map<String, dynamic>>[
    {
      'title': 'Mobile Device Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/device_repair.png',
      'longitude': 106.84513,
      'latitude': -6.20876,
      'address': 'Jl. Merdeka No.10, Jakarta',
    },
    {
      'title': 'Laptop Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/laptop_repair.png',
      'longitude': 107.60981,
      'latitude': -6.91746,
      'address': 'Jl. Braga No.5, Bandung',
    },
    {
      'title': 'Smartphone Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/smartphone_repair.png',
      'longitude': 110.36706,
      'latitude': -7.80139,
      'address': 'Jl. Malioboro No.20, Yogyakarta',
    },
    {
      'title': 'Camera Repair',
      'price': '\$15.00',
      'provider': 'Alan',
      'image': 'assets/camera_repair.png',
      'longitude': 115.2221,
      'latitude': -8.6705,
      'address': 'Jl. Sunset Road No.45, Bali',
    },
  ].obs; // Observing the list for changes
}
