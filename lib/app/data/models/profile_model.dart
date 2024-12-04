import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final RxString id;
  final RxString name;
  final RxString phone;
  final RxString email;
  final RxString imagePath;

  Profile({
    String? id,
    required String name,
    required String phone,
    required String email,
    String? imagePath,
  })  : id = RxString(id ?? ''),
        name = RxString(name.trim()),
        phone = RxString(phone.trim()),
        email = RxString(email.trim()),
        imagePath = RxString(imagePath ?? '');

  Map<String, dynamic> toJson() => {
        'id': id.value,
        'name': name.value,
        'phone': phone.value,
        'email': email.value,
        'imagePath': imagePath.value,
      };

  factory Profile.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Profile(
      id: doc.id,
      name: data['name']?.toString() ?? '',
      phone: data['phone']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      imagePath: data['imagePath']?.toString() ?? '',
    );
  }

  factory Profile.empty() => Profile(
        name: '',
        phone: '',
        email: '',
      );
}
