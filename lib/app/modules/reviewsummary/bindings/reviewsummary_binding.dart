import 'package:get/get.dart';
import '../controllers/reviewsummary_controller.dart';

class ReviewSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsummaryController>(() => ReviewsummaryController());
  }
}
