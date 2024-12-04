import 'package:cloud_firestore/cloud_firestore.dart';

class BookingData {
  final String id;
  final String serviceType;
  final String providerName;
  final double price;
  final String status;
  final String description;
  final String address;
  final DateTime orderDate;

  BookingData({
    required this.id,
    required this.serviceType,
    required this.providerName,
    required this.price,
    required this.status,
    required this.description,
    required this.address,
    required this.orderDate,
  });

  factory BookingData.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookingData(
      id: doc.id,
      serviceType: data['serviceType'] ?? '',
      providerName: data['providerName'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      status: data['status'] ?? 'pending',
      description: data['description'] ?? '',
      address: data['address'] ?? '',
      orderDate: (data['orderDate'] as Timestamp).toDate(),
    );
  }
}