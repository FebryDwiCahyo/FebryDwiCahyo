import 'package:get/get.dart';

class FaqController extends GetxController {
  final RxString searchQuery = ''.obs;
  final RxString selectedCategory = 'All'.obs;
  final RxList<FaqItem> faqItems = <FaqItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFaqItems();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterFaqItems();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    filterFaqItems();
  }

  void loadFaqItems() {
    // In a real app, you might load this from an API or database
    faqItems.value = [
      FaqItem(
        question: 'What i need to cancel a booking?',
        answer: 'The booking was canceled due to a scheduling conflict with another event.',
        category: 'Service',
      ),
      FaqItem(
        question: 'Is safe to use App?',
        answer: 'Yes, our app is designed with security in mind and uses encryption to protect your data.',
        category: 'General',
      ),
      FaqItem(
        question: 'How do activate Booking details?',
        answer: 'To activate booking details, go to your profile and select "My Bookings". Then choose the booking you want to activate.',
        category: 'Account',
      ),
      FaqItem(
        question: 'Need more help?',
        answer: '', // The button will appear instead of the answer
        category: 'General',
      ),
      // Add more FAQ items here
    ];
  }

  void filterFaqItems() {
    final query = searchQuery.value.toLowerCase();
    final category = selectedCategory.value;

    // Ambil data asli FAQ items (dari loadFaqItems)
    List<FaqItem> allItems = [
      FaqItem(
        question: 'What i need to cancel a booking?',
        answer: 'The booking was canceled due to a scheduling conflict with another event.',
        category: 'Service',
      ),
      FaqItem(
        question: 'Is safe to use App?',
        answer: 'Yes, our app is designed with security in mind and uses encryption to protect your data.',
        category: 'General',
      ),
      FaqItem(
        question: 'How do activate Booking details?',
        answer: 'To activate booking details, go to your profile and select "My Bookings". Then choose the booking you want to activate.',
        category: 'Account',
      ),
      FaqItem(
        question: 'Need more help?',
        answer: '', // Button will appear instead of the answer
        category: 'General',
      ),
    ];

    // Filter berdasarkan pencarian dan kategori
    faqItems.value = allItems.where((item) {
      final matchesSearch = item.question.toLowerCase().contains(query) ||
          item.answer.toLowerCase().contains(query);
      final matchesCategory = category == 'All' || item.category == category;
      return matchesSearch && matchesCategory;
    }).toList();
}

}

class FaqItem {
  final String question;
  final String answer;
  final String category;

  FaqItem({required this.question, required this.answer, required this.category});
}