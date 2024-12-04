import 'package:get/get.dart';

class BookcancelledController extends GetxController {
  final currentTab = 0.obs;
  final currentNavIndex = 2.obs;
  final bookings = <Booking>[].obs;
  RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize bookings data
    bookings.addAll([
      Booking('Smartphone Repair', '\$15.00', 'Bob', 'assets/repair5.jpeg'),
    ]);
  }

  void changeTab(String tab) {
    switch (tab) {
      case 'Upcoming':
        currentTab.value = 0;
        break;
      case 'Completed':
        currentTab.value = 1;
        break;
      case 'Cancelled':
        currentTab.value = 2;
        break;
    }
    // Here you would typically fetch the relevant bookings
  }

  void changeNavIndex(int index) {
    currentNavIndex.value = index;
    // Handle navigation
  }

  void viewMoreDetails(String bookingTitle) {
    // Navigate to booking details page
    Get.toNamed('/booking-details', arguments: bookingTitle);
  }
}

class Booking {
  final String title;
  final String price;
  final String technician;
  final String imagePath;

  Booking(this.title, this.price, this.technician, this.imagePath);
}
