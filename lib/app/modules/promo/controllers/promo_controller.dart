import 'package:get/get.dart';

class PromoController extends GetxController {
  // List of promos
  var promoList = <Map<String, dynamic>>[
    {
      'title': 'Promo Merdeka Diskon 17%',
      'image': 'assets/promo_merdeka_17_percent.png', // Replace with actual image path
    },
    {
      'title': 'Promo Kemerdekaan Diskon 17K',
      'image': 'assets/promo_kemerdekaan_17k.png',
    },
    {
      'title': 'Promo Merdeka Diskon 17%',
      'image': 'assets/promo_merdeka_17_percent.png',
    },
  ].obs; // Observable list for automatic updates
}
