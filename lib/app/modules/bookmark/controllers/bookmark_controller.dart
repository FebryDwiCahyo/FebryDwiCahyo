import 'package:get/get.dart';

class BookmarkController extends GetxController {
  // List of bookmark items (you can modify this with actual data)
  var bookmarkList = <Map<String, dynamic>>[
    {
      'title': 'Mobile Device Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/device_repair.png', // Sample image path
    },
    {
      'title': 'Laptop Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/laptop_repair.png',
    },
    {
      'title': 'Smartphone Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/smartphone_repair.png',
    },
    {
      'title': 'Camera Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/camera_repair.png',
    },
  ].obs; // Observing the list for changes

  // Any additional logic for bookmark can be added here
}
