import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ServiceOrder {
  final RxString id;
  final RxString userId;
  final RxString serviceType;
  final RxString providerName;
  final RxString status;
  final RxDouble price;
  final RxString description;
  final RxString userPhone;
  final RxString userEmail;
  final RxString userName;
  final Rx<DateTime> orderDate;
  final RxString address;

  ServiceOrder({
    String? id,
    required String userId,
    required String serviceType,
    required String providerName,
    String status = 'pending',
    required double price,
    required String description,
    required String userPhone,
    required String userEmail,
    required String userName,
    required DateTime orderDate,
    required String address,
  })  : id = RxString(id ?? ''),
        userId = RxString(userId),
        serviceType = RxString(serviceType),
        providerName = RxString(providerName),
        status = RxString(status),
        price = RxDouble(price),
        description = RxString(description),
        userPhone = RxString(userPhone),
        userEmail = RxString(userEmail),
        userName = RxString(userName),
        orderDate = Rx<DateTime>(orderDate),
        address = RxString(address);

  Map<String, dynamic> toJson() => {
        'id': id.value,
        'userId': userId.value,
        'serviceType': serviceType.value,
        'providerName': providerName.value,
        'status': status.value,
        'price': price.value,
        'description': description.value,
        'userPhone': userPhone.value,
        'userEmail': userEmail.value,
        'userName': userName.value,
        'orderDate': orderDate.value,
        'address': address.value,
      };

  factory ServiceOrder.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ServiceOrder(
      id: doc.id,
      userId: data['userId'] ?? '',
      serviceType: data['serviceType'] ?? '',
      providerName: data['providerName'] ?? '',
      status: data['status'] ?? 'pending',
      price: (data['price'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      userPhone: data['userPhone'] ?? '',
      userEmail: data['userEmail'] ?? '',
      userName: data['userName'] ?? '',
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      address: data['address'] ?? '',
    );
  }
}
