import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsController extends GetxController {
  final RxString locationMessage = "Finding Latitude and Longitude. . .".obs;
  final RxBool loading = false.obs;
  Rx<Position?> currentPosition = Rx<Position?>(null);

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
      locationMessage.value = 
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      loading.value = false;
    } catch (e) {
      loading.value = false;
      locationMessage.value = 'Gagal mendapatkan lokasi';
    }
  }

  void openGoogleMaps() {
    if (currentPosition.value != null) {
      final url = 
        'https://www.google.com/maps?q=${currentPosition.value!.latitude},${currentPosition.value!.longitude}';
      launchUrl(Uri.parse(url));
    }
  }
}