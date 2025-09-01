import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/core/utils/card_validator_service.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.formKey,
    required this.cardNumberController,
    required this.cvvController,
    required this.selectedCountryCode,
    required this.selectedCountryName,
    required this.cardHolderNameController,
    required this.expiryDateController,
    required this.bannedCountryCodes,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;
  final TextEditingController expiryDateController;
  final String? selectedCountryCode;
  final String? selectedCountryName;
  final List<String> bannedCountryCodes;

  void _submitCard(BuildContext context) async {
    if (CardValidatorService.validateName(cardHolderNameController.text) !=
            null ||
        CardValidatorService.validateCardNumber(cardNumberController.text) !=
            null ||
        CardValidatorService.validateCVV(cvvController.text) != null ||
        CardValidatorService.validateExpiryDate(expiryDateController.text) !=
            null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly.')),
      );
      return;
    }

    if (selectedCountryCode == null || selectedCountryName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a country.')),
      );
      return;
    }

    // Check banned countries
    final prefs = await SharedPreferences.getInstance();
    final bannedCodes =
        prefs.getStringList('bannedCountries') ?? bannedCountryCodes;

    if (bannedCodes.contains(selectedCountryCode)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cards from $selectedCountryName are not allowed.'),
        ),
      );
      return;
    }

    final cleanedNumber =
        CardValidatorService.cleanedNumber(cardNumberController.text);
    final cardType =
        CardValidatorService.getCreditCardTypeFromNumbers(cleanedNumber);

    final expiryParts =
        CardValidatorService.getCardExpiryDate(expiryDateController.text);
    final month = expiryParts.isNotEmpty ? expiryParts[0] : null;
    final year = expiryParts.length > 1 ? expiryParts[1] : null;

    final cvv = int.tryParse(cvvController.text.trim());

    final card = CreditCardDto(
      cardNumber: cleanedNumber,
      cardType: cardType,
      cardHolderName: cardHolderNameController.text.trim(),
      month: month,
      year: year,
      cvv: cvv,
      issuingCountry:
          CountryDto(name: selectedCountryName!, code: selectedCountryCode!),
    );

    context.read<CreditCardBloc>().add(OnAddCard(card: card));
  }

  void _clearFields() {
    cardNumberController.clear();
    cvvController.clear();
    cardHolderNameController.clear();
    expiryDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditCardBloc, CreditCardState>(
      listenWhen: (previous, current) =>
          previous.isCardAdded != current.isCardAdded,
      listener: (context, state) {
        if (state.isCardAdded == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Card added successfully!')),
          );
          _clearFields();
        } else if (state.isCardAdded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add card.')),
          );
        }
      },
      child: ElevatedButton(
        onPressed: () => _submitCard(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: const Text('Add Card'),
      ),
    );
  }
}
