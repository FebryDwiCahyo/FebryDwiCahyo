import 'package:get/get.dart';

class MessageController extends GetxController {
  // List of messages
  var messageList = <Map<String, dynamic>>[
    {
      'title': 'Mobile Device Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/device_repair.png', // Replace with actual image path
    },
    {
      'title': 'Laptop Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/laptop_repair.png',
    },
  ].obs; // Observing the list for changes
}
