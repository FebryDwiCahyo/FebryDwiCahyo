import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Observable variable

  final totalPages = 2; // Total 3 pages (index 0, 1, 2)

  void nextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value += 1;
    } else {
      Get.offNamed('/started'); 
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
    }
  }

  void skipOnboarding() {
    Get.offNamed('/started');
  }
}
