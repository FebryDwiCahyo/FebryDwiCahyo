import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Remove any previous spacing
    String inputData = newValue.text.replaceAll(' ', '');
    
    // Limit the input to 16 digits
    if (inputData.length > 16) {
      return oldValue;
    }

    // Only allow digits
    if (!RegExp(r'^[0-9]*$').hasMatch(inputData)) {
      return oldValue;
    }

    StringBuffer buffer = StringBuffer();

    // Add space after every 4 digits
    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != inputData.length) {
        buffer.write(' ');
      }
    }

    String formattedText = buffer.toString();
    
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Remove any previous spacing or slashes
    String inputData = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    // Limit the input to 4 digits (MMYY)
    if (inputData.length > 4) {
      return oldValue;
    }

    // Only allow digits
    if (!RegExp(r'^[0-9]*$').hasMatch(inputData)) {
      return oldValue;
    }

    StringBuffer buffer = StringBuffer();

    // Format as MM/YY
    for (int i = 0; i < inputData.length; i++) {
      // First check if the first digit of month is valid
      if (i == 0 && int.parse(inputData[i]) > 1) {
        buffer.write('0');
        buffer.write(inputData[i]);
        buffer.write('/');
      }
      // Check if the month is valid (01-12)
      else if (i == 1) {
        if (int.parse(inputData[0] + inputData[1]) > 12) {
          return oldValue;
        }
        buffer.write(inputData[i]);
        buffer.write('/');
      }
      // Add other digits
      else {
        buffer.write(inputData[i]);
      }
    }

    String formattedText = buffer.toString();
    
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}

class CardHolderNameFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Allow only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(newValue.text)) {
      return oldValue;
    }

    // Capitalize each word
    String formattedText = newValue.text.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}

class CVVInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Remove any non-digits
    String inputData = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    // Limit to 3 or 4 digits (depending on card type, default to 3)
    if (inputData.length > 3) {
      return oldValue;
    }

    // Only allow digits
    if (!RegExp(r'^[0-9]*$').hasMatch(inputData)) {
      return oldValue;
    }

    return TextEditingValue(
      text: inputData,
      selection: TextSelection.collapsed(
        offset: inputData.length,
      ),
    );
  }
}