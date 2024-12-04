import 'package:get/get.dart';

class ContactUsController extends GetxController {
  void onContactItemTap(String item) {
    // Handle taps on contact items
    switch (item) {
      case 'Customer Services':
        // Open customer service chat or call
        break;
      case 'WhatsApp':
        // Open WhatsApp chat
        break;
      case 'Website':
        // Open website URL
        break;
      case 'Facebook':
        // Open Facebook page
        break;
      case 'Twitter':
        // Open Twitter profile
        break;
      case 'Instagram':
        // Open Instagram profile
        break;
    }
    print('Tapped on $item');
  }
}