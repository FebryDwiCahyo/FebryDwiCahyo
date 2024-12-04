import 'package:get/get.dart';

class NotificationController extends GetxController {
  // List of notifications
  final notifications = [
    {
      'title': 'Service Booked Successfully',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1h',
      'isNew': true
    },
    {
      'title': '40% Off on Laptop Repair',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1h',
      'isNew': true
    },
    {
      'title': 'Service Review Request',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1h',
      'isNew': true
    },
    {
      'title': 'Service Booked Successfully',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1d',
      'isNew': false
    },
    {
      'title': 'New DANA Added',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1d',
      'isNew': false
    },
    {
      'title': 'Your Request Has Been Sent',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
      'time': '1d',
      'isNew': false
    }
  ].obs;

  // Mark all as read
  void markAllAsRead() {
    for (var notification in notifications) {
      notification['isNew'] = false;
    }
    notifications.refresh();
  }
}
