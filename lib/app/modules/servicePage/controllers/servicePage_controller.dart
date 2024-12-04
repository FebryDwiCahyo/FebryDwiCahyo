import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ServicePageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final RxDouble rating = 4.9.obs;
  final RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 3,
      vsync: this,
    )..addListener(() {
        selectedTabIndex.value = tabController.index;
      });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void onSharePressed() {
    // Implement share functionality
    print('Share pressed');
  }

  void onBookmarkPressed() {
    // Implement bookmark functionality
    print('Bookmark pressed');
  }

  void onRatingChanged(double value) {
    rating.value = value;
  }

  void onBookNowPressed() {
    // Implement booking functionality
    print('Book now pressed');
  }
}