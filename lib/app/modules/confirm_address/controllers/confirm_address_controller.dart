// File 2: /lib/app/modules/confirm_address/controllers/confirm_address_controller.dart
import 'package:get/get.dart';

class ConfirmAddressController extends GetxController {
  final homeAddressSelected = true.obs;
  final parentsAddressSelected = false.obs;
  final brotherAddressSelected = false.obs;

  void setHomeAddressSelected(bool? value) {
    if (value != null) {
      homeAddressSelected.value = value;
      if (value) {
        parentsAddressSelected.value = false;
        brotherAddressSelected.value = false;
      }
    }
  }

  void setParentsAddressSelected(bool? value) {
    if (value != null) {
      parentsAddressSelected.value = value;
      if (value) {
        homeAddressSelected.value = false;
        brotherAddressSelected.value = false;
      }
    }
  }

  void setBrotherAddressSelected(bool? value) {
    if (value != null) {
      brotherAddressSelected.value = value;
      if (value) {
        homeAddressSelected.value = false;
        parentsAddressSelected.value = false;
      }
    }
  }

  void addNewAddress() {
    // TODO: Implement add new address navigation
    print('Add new address pressed');
  }

  void continuePressed() {
    // TODO: Implement continue logic with selected address
    final selectedAddress = homeAddressSelected.value ? 'Home' 
      : parentsAddressSelected.value ? 'Parent\'s House'
      : brotherAddressSelected.value ? 'Brother House'
      : null;
      
    if (selectedAddress != null) {
      print('Continuing with selected address: $selectedAddress');
      // Navigate to next screen or process the selection
    }
  }
}
