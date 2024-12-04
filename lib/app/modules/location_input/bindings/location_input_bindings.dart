import 'package:get/get.dart';
import '../controllers/location_input_controller.dart';

class LocationInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationInputController>(() => LocationInputController());
  }
}