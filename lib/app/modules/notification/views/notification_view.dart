import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          TextButton(
            onPressed: controller.markAllAsRead,
            child: const Text(
              'Mark all as read',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text('TODAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...controller.notifications.where((n) => n['time'] == '1h').map((notification) {
              // Cast to Map<String, dynamic> to properly access fields
              final Map<String, dynamic> notif = notification as Map<String, dynamic>;
              return NotificationTile(
                title: notif['title'],
                description: notif['description'],
                time: notif['time'],
                isNew: notif['isNew'],
              );
            }),
            const SizedBox(height: 20),
            const Text('YESTERDAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...controller.notifications.where((n) => n['time'] == '1d').map((notification) {
              final Map<String, dynamic> notif = notification as Map<String, dynamic>;
              return NotificationTile(
                title: notif['title'],
                description: notif['description'],
                time: notif['time'],
                isNew: notif['isNew'],
              );
            }),
          ],
        );
      }),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final bool isNew;

  const NotificationTile({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: const Icon(Icons.notifications, color: Colors.blue),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey)),
          if (isNew)
            Container(
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'New',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
