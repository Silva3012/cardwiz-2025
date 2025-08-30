import 'package:cardwiz/core/utils/card_utils.dart';

class ValidatorService {
  static String? validatedCardNumber(String? value) {
    if (value == null || value.isEmpty) return 'Enter Card Number';
    if (!CardUtils.validateCardNumber(cardNumber: value)) {
      return 'Invalid Card Number';
    }
    return null;
  }

  static String? validateCvv(String? value) {
    if (value == null || value.isEmpty) return 'Enter CVV';
    if (!RegExp(r'^\d{3,4}$').hasMatch(value)) return 'Invalid CVV';
    return null;
  }

  static String? validateIssuingCountry(String? value) {
    if (value == null || value.isEmpty) return 'Select issuing country';
    return null;
  }

  static String? validateCardType(String cardNumber, String cardType) {
    final detectedType = CardUtils.detectCardType(cardNumber: cardNumber);
    if (detectedType != cardType) return 'Card type does not match number';
    return null;
  }

  static String? validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) return 'Card holder name is required';
    if (value.trim().split(' ').length < 2) {
      return 'Enter full name';
    }
    if (!RegExp(r"^[a-zA-Z\s\.\'-]+$").hasMatch(value)) {
      return 'Invalid characters in name';
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) return 'Expiry date is required';

    final regex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
    if (!regex.hasMatch(value)) return 'Invalid format (MM/YY)';

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) return 'Invalid expiry date';

    final now = DateTime.now();
    final fourDigitYear = 2000 + year;
    final expiryDate =
        DateTime(fourDigitYear, month + 1, 0); // end of that month

    if (expiryDate.isBefore(DateTime(now.year, now.month, 1))) {
      return 'Card expired';
    }

    return null;
  }
}
