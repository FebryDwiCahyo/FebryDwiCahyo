import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String id;
  final String title;
  final String price;
  final String provider;
  final String image;
  final DateTime timestamp;
  final bool isRead;
  final String? providerId;

  ChatMessage({
    required this.id,
    required this.title,
    required this.price,
    required this.provider,
    required this.image,
    required this.timestamp,
    this.isRead = false,
    this.providerId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'provider': provider,
        'image': image,
        'timestamp': timestamp,
        'isRead': isRead,
        'providerId': providerId,
      };

  factory ChatMessage.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatMessage(
      id: doc.id,
      title: data['title'] ?? '',
      price: data['price'] ?? '',
      provider: data['provider'] ?? '',
      image: data['image'] ?? 'assets/default_repair.png',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      isRead: data['isRead'] ?? false,
      providerId: data['providerId'],
    );
  }

  ChatMessage copyWith({
    String? id,
    String? title,
    String? price,
    String? provider,
    String? image,
    DateTime? timestamp,
    bool? isRead,
    String? providerId,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      provider: provider ?? this.provider,
      image: image ?? this.image,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      providerId: providerId ?? this.providerId,
    );
  }
}