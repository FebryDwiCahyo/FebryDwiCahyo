import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final currentNavIndex = 0.obs;

  final String galleryImageUrl = 'https://example.com/gallery_logo.jpg';
  final String galleryName = 'Nature Wonders';
  final String galleryDescription = 'Breathtaking nature photography';
  final String galleryLocation = 'Worldwide';
  final int photoCount = 1500;
  final int viewCount = 50000;
  final double rating = 4.8;
  final int likeCount = 10000;

  final List<Photo> photos = [
    Photo(imageUrl: 'https://example.com/nature1.jpg'),
    Photo(imageUrl: 'https://example.com/nature2.jpg'),
    Photo(imageUrl: 'https://example.com/nature3.jpg'),
    // Add more photos here
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }

  void changeNavIndex(int index) {
    currentNavIndex.value = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class Photo {
  final String imageUrl;

  Photo({required this.imageUrl});
}