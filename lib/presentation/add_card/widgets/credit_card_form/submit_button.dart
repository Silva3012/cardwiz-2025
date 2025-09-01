import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/core/utils/card_validator_service.dart';
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

  void _onSubmit(BuildContext context) {
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

    final card = CreditCardDto(
      cardNumber: cleanedNumber,
      cardType: cardType,
      cardHolderName: cardHolderNameController.text.trim(),
      month: month,
      year: year,
      cvv: cvv,
      issuingCountry: selectedCountry!,
    );

    context.read<CreditCardBloc>().add(OnAddCard(card: card));

    cardNumberController.clear();
    cvvController.clear();
    cardHolderNameController.clear();
    expiryDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onSubmit(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: const Text('Add Card'),
    );
  }
}
