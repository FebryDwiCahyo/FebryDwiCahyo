import 'dart:convert';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/address.dart'; // Pastikan path benar

class HomeController extends GetxController {
    Rx<Position?> currentPosition = Rx<Position?>(null);
  final RxString addressDetails = "Surabaya".obs;
  final RxBool loading = false.obs;

  Future<void> getCurrentLocation() async {
    loading.value = true;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        throw Exception('Location service not enabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permission denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied forever');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      currentPosition.value = position;
      await fetchAddress(position.latitude, position.longitude);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      addressDetails.value = 'Failed to get address';
    }
  }

  Future<void> fetchAddress(double lat, double lon) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lon');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final welcome = Welcome.fromJson(data);
        final address = welcome.address;
        addressDetails.value =
            "${address.village ?? address.city ?? address.county}, ${address.state}, ${address.country}";
      } else {
        throw Exception('Failed to fetch address');
      }
    } catch (e) {
      addressDetails.value = 'Failed to fetch address';
    }
  }


  final count = 0.obs;

  get tabController => null;

  void increment() => count.value++;

  buildScreens() {}

  var services = <Map<String, dynamic>>[
    {
      'title': 'Mobile Device Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/device_repair1.png',
      'address': 'Jl. Merdeka No.10, Jakarta',
    },
    {
      'title': 'Laptop Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/laptop_repair1.png',
      'address': 'Jl. Braga No.5, Bandung',
    },
    {
      'title': 'Smartphone Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/smartphone_repair1.png',
      'address': 'Jl. Malioboro No.20, Yogyakarta',
    },
    {
      'title': 'Camera Repair',
      'price': '\$15.00',
      'provider': 'Alan',
      'image': 'assets/camera_repair1.png',
      'address': 'Jl. Sunset Road No.45, Bali',
    },
  ].obs;

  // Filtered services list
  final RxList<Map<String, dynamic>> filteredServices = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initially, filtered services is the same as all services
    filteredServices.value = services;
  }

  void filterServicesByLocation(String query) {
    if (query.isEmpty) {
      // If query is empty, show all services
      filteredServices.value = services;
    } else {
      // Filter services where address contains the query (case-insensitive)
      filteredServices.value = services.where((service) {
        return service['address'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
