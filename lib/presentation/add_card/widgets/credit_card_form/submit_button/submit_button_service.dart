import 'package:cardwiz/core/utils/card_validator_service.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';

class SubmitCreditCardService {
  final List<String> bannedCountryCodes;

  SubmitCreditCardService({required this.bannedCountryCodes});

  Future<bool> isCountryBanned(String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    final codes = prefs.getStringList('bannedCountries') ?? bannedCountryCodes;
    return codes.contains(countryCode);
  }

  String? validateFields({
    required String cardHolderName,
    required String cardNumber,
    required String cvv,
    required String expiryDate,
  }) {
    final nameError = CardValidatorService.validateName(cardHolderName);
    if (nameError != null) return nameError;

    final numberError = CardValidatorService.validateCardNumber(cardNumber);
    if (numberError != null) return numberError;

    final cvvError = CardValidatorService.validateCVV(cvv);
    if (cvvError != null) return cvvError;

    final expiryError = CardValidatorService.validateExpiryDate(expiryDate);
    if (expiryError != null) return expiryError;

    return null;
  }

  CreditCardDto createCard({
    required String cardHolderName,
    required String cardNumber,
    required String cvv,
    required String expiryDate,
    required String countryName,
    required String countryCode,
  }) {
    final cleanedNumber = CardValidatorService.cleanedNumber(cardNumber);
    final cardType =
        CardValidatorService.getCreditCardTypeFromNumbers(cleanedNumber);

    final expiryParts = CardValidatorService.getCardExpiryDate(expiryDate);
    final month = expiryParts.isNotEmpty ? expiryParts[0] : null;
    final year = expiryParts.length > 1 ? expiryParts[1] : null;

    final cvvInt = int.tryParse(cvv.trim());

    return CreditCardDto(
      cardNumber: cleanedNumber,
      cardType: cardType,
      cardHolderName: cardHolderName.trim(),
      month: month,
      year: year,
      cvv: cvvInt,
      issuingCountry: CountryDto(name: countryName, code: countryCode),
    );
  }

  Future<void> submitCard({
    required BuildContext context,
    required String cardHolderName,
    required String cardNumber,
    required String cvv,
    required String expiryDate,
    required String countryName,
    required String countryCode,
  }) async {
    final validationError = validateFields(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cvv: cvv,
      expiryDate: expiryDate,
    );
    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError)),
      );
      return;
    }

    if (await isCountryBanned(countryCode)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cards from $countryName are not allowed.')),
      );
      return;
    }

    final card = createCard(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cvv: cvv,
      expiryDate: expiryDate,
      countryName: countryName,
      countryCode: countryCode,
    );

    context.read<CreditCardBloc>().add(OnAddCard(card: card));
  }
}
