import 'package:get/get.dart';

class CardValidator {
  /// Validates the card holder name
  /// Returns true if the name contains at least a first and last name
  /// and only contains letters and spaces
  static bool validateCardHolderName(String name) {
    if (name.isEmpty) return false;

    // Check if name contains at least two words (first and last name)
    final nameParts = name.trim().split(' ');
    if (nameParts.length < 2) return false;

    // Check if each part is at least 2 characters long and contains only letters
    for (final part in nameParts) {
      if (part.length < 2) return false;
      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(part)) return false;
    }

    return true;
  }

  /// Validates the card number using the Luhn algorithm
  /// Also checks for proper length and format
  static bool validateCardNumber(String number) {
    // Remove all non-digits
    final cleanNumber = number.replaceAll(RegExp(r'\D'), '');

    // Check if the length is valid (most cards are 16 digits)
    if (cleanNumber.length != 16) return false;

    // Implement Luhn algorithm
    int sum = 0;
    bool alternate = false;

    // Loop through values starting from the rightmost one
    for (int i = cleanNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  /// Validates the card expiry date
  /// Checks if the date is in proper format and not expired
  static bool validateExpiryDate(String expiry) {
    if (expiry.isEmpty) return false;

    // Check format (MM/YY)
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiry)) return false;

    final parts = expiry.split('/');
    if (parts.length != 2) return false;

    try {
      final month = int.parse(parts[0]);
      final year = int.parse(parts[1]);

      // Check if month is valid (1-12)
      if (month < 1 || month > 12) return false;

      // Convert 2-digit year to 4-digit year
      final fourDigitYear = 2000 + year;

      // Get current date
      final now = DateTime.now();
      final cardDate = DateTime(fourDigitYear, month);

      // Check if card is not expired
      // Also check if date is not more than 10 years in the future
      return cardDate.isAfter(now) && 
             cardDate.isBefore(now.add(const Duration(days: 3650)));
    } catch (e) {
      return false;
    }
  }

  /// Validates the CVV
  /// Checks if it's the proper length and contains only digits
  static bool validateCVV(String cvv) {
    // Remove any whitespace
    final cleanCVV = cvv.trim();

    // Check length (3 or 4 digits depending on card type, most common is 3)
    if (cleanCVV.length != 3) return false;

    // Check if contains only digits
    if (!RegExp(r'^\d+$').hasMatch(cleanCVV)) return false;

    return true;
  }

  /// Validates the full card data
  /// Returns a pair of bool and error message
  static (bool, String?) validateCardData({
    required String cardHolderName,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) {
    // Validate Card Holder Name
    if (!validateCardHolderName(cardHolderName)) {
      return (false, 'Please enter a valid card holder name');
    }

    // Validate Card Number
    if (!validateCardNumber(cardNumber)) {
      return (false, 'Please enter a valid card number');
    }

    // Validate Expiry Date
    if (!validateExpiryDate(expiryDate)) {
      return (false, 'Please enter a valid expiry date');
    }

    // Validate CVV
    if (!validateCVV(cvv)) {
      return (false, 'Please enter a valid CVV');
    }

    return (true, null);
  }

  /// Identifies the card type based on the number
  /// Returns the card type as a string
  static String getCardType(String cardNumber) {
    // Remove any non-digit characters
    final cleanNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (cleanNumber.isEmpty) return 'Unknown';

    // Visa
    if (cleanNumber.startsWith('4')) {
      return 'Visa';
    }

    // Mastercard
    if (cleanNumber.startsWith(RegExp(r'5[1-5]'))) {
      return 'Mastercard';
    }

    // American Express
    if (cleanNumber.startsWith(RegExp(r'3[47]'))) {
      return 'American Express';
    }

    // Discover
    if (cleanNumber.startsWith(RegExp(r'6(?:011|5)'))) {
      return 'Discover';
    }

    return 'Unknown';
  }

  /// Shows a snackbar with an error message
  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 3),
    );
  }
}

/// Extension methods for card-related string operations
extension CardStringExtensions on String {
  /// Formats a card number string with spaces
  String formatCardNumber() {
    final cleaned = replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    
    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cleaned[i]);
    }
    
    return buffer.toString();
  }

  /// Masks a card number for display
  String maskCardNumber() {
    final cleaned = replaceAll(RegExp(r'\D'), '');
    if (cleaned.length < 4) return this;
    
    return '**** **** **** ${cleaned.substring(cleaned.length - 4)}';
  }
}