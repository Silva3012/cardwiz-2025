import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/core/utils/card_validator_service.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.formKey,
    required this.cardNumberController,
    required this.cvvController,
    required this.selectedCountry,
    required this.cardHolderNameController,
    required this.expiryDateController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;
  final TextEditingController expiryDateController;
  final String? selectedCountry;

  void _submitCard(BuildContext context) {
    final nameError =
        CardValidatorService.validateName(cardHolderNameController.text);
    final numberError =
        CardValidatorService.validateCardNumber(cardNumberController.text);
    final cvvError = CardValidatorService.validateCVV(cvvController.text);
    final expiryError =
        CardValidatorService.validateExpiryDate(expiryDateController.text);

    if (nameError != null ||
        numberError != null ||
        cvvError != null ||
        expiryError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly.')),
      );
      return;
    }

    if (selectedCountry == null || selectedCountry!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a country.')),
      );
      return;
    }

    final cleanedNumber =
        CardValidatorService.cleanedNumber(cardNumberController.text);
    final cardType =
        CardValidatorService.getCreditCardTypeFromNumbers(cleanedNumber);

    int? month;
    int? year;
    final expiryParts =
        CardValidatorService.getCardExpiryDate(expiryDateController.text);
    if (expiryParts.length == 2) {
      month = expiryParts[0];
      year = expiryParts[1];
    }

    final cvv = int.tryParse(cvvController.text.trim());

    final countryDto = CountryDto(name: selectedCountry!, code: '');

    final card = CreditCardDto(
      cardNumber: cleanedNumber,
      cardType: cardType,
      cardHolderName: cardHolderNameController.text.trim(),
      month: month,
      year: year,
      cvv: cvv,
      issuingCountry: countryDto,
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
