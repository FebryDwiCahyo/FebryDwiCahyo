import 'package:get/get.dart';

class AboutController extends GetxController {
  final String name = 'Jenny Wilson';
  final String profession = 'Mobile Phone Repair';
  final String location = 'New York';
  final String profileImageUrl = 'https://example.com/jenny_wilson.jpg';
  final int customerCount = 2500;
  final int experienceYears = 3;
  final double rating = 4.8;
  final int reviewCount = 1400;
  final String aboutService = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud...';
  
  final Map<String, String> workingHours = {
    'Monday': '00:00 - 00:00',
    'Tuesday': '00:00 - 00:00',
    // Add other days as needed
  };
}