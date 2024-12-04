import 'package:get/get.dart';

class EreceiptController extends GetxController {
  final String serviceName = 'Mobile Device Repair';
  final String serviceProvider = 'Jenny Wilson';
  final String bookingDate = 'October 04, 2023 | 10.00 AM';
  final String amount = '180.00';
  final String taxAndFees = '30.00';
  final String total = '210.00';
  final String name = 'Dave';
  final String phoneNumber = '12345678';
  final String transactionId = '#abcdef';

  void downloadReceipt() {
    // Implement download functionality here
    Get.snackbar('Download', 'E-Receipt downloaded successfully');
  }
}
