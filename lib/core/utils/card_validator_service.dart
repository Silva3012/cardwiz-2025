import 'package:cardwiz/core/utils/card_type_enum.dart';

class CardValidatorService {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the name on the Card";
    }
    return null;
  }

  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your card number";
    }
    value = cleanedNumber(value);
    if (value.length < 8) {
      return "Invalid Card";
    }

    int sum = 0;
    for (var i = 0; i < value.length; i++) {
      int digit = int.parse(value[value.length - i - 1]);
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return "Invalid Card";
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your CVV";
    }
    if (value.length < 3 || value.length > 4) {
      return "Your CVV is invalid";
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the Expiry date";
    }

    int year;
    int month;

    if (value.contains(RegExp(r'(/)'))) {
      var splitValue = value.split(RegExp(r'(/)'));

      month = int.parse(splitValue[0]);
      year = int.parse(splitValue[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1;
    }

    if ((month < 1) || (month > 12)) {
      return "Invalid expiry month";
    }

    var fourDigitsYear = yearToFourDigits(year);

    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return "Invalid expiry year";
    }

    if (!isDateExpired(month, year)) {
      return "The card has expired";
    }
    return null;
  }

  static int yearToFourDigits(int year) {
    if (year < 100 && year >= 0) {
      final now = DateTime.now();
      final currentYear = now.year.toString();
      final prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool isDateExpired(int month, int year) {
    return isDateNotExpired(year, month);
  }

  static bool isDateNotExpired(int year, int month) {
    return !isYearPassed(year) && !isMonthPassed(year, month);
  }

  static bool isYearPassed(int year) {
    int fourDigitsYear = yearToFourDigits(year);
    final now = DateTime.now();
    return fourDigitsYear < now.year;
  }

  static bool isMonthPassed(int year, int month) {
    final now = DateTime.now();
    return isYearPassed(year) ||
        yearToFourDigits(year) == now.year && (month < now.month + 1);
  }

  static List<int> getCardExpiryDate(String value) {
    final split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static String cleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, "");
  }

  static CardType getCreditCardTypeFromNumbers(String numbers) {
    CardType cardType;
    if (numbers.startsWith(RegExp(r'4'))) {
      cardType = CardType.visa;
    } else if (numbers.startsWith(
        RegExp(r'(5018|5020|5038|5893|6304|6759|6761|6762|6763)'))) {
      cardType = CardType.maestro;
    } else if (numbers.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.mastercard;
    } else if (numbers.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }
}
