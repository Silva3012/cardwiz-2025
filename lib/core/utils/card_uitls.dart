class CardUitls {
  /// Detect card type from card number
  static String detectCardType(String cardNumber) {
    if (cardNumber.startsWith('4')) return 'Visa';
    if (RegExp(r'^5[1-5]').hasMatch(cardNumber)) return 'Mastercard';
    return 'Unknown';
  }

  /// Luhn algorithm to validate card number
  static bool validateCardNumber(String cardNumber) {
    final digits = cardNumber
        .replaceAll(RegExp(r'\D'), '')
        .split('')
        .map(int.parse)
        .toList();
    int sum = 0;
    for (var i = 0; i < digits.length; i++) {
      var digit = digits[digits.length - 1 - i];
      if (i % 2 == 1) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
    }
    return sum % 10 == 0;
  }

  /// Check if issuing country is banned
  static bool isBannedCountry(String country, List<String> bannedCountries) {
    return bannedCountries.contains(country);
  }
}
