import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/core/utils/card_utils.dart';
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
    if (!formKey.currentState!.validate() || selectedCountry == null) return;

    final card = CreditCardDto(
      cardNumber: cardNumberController.text.trim(),
      cvv: cvvController.text.trim(),
      issuingCountry: selectedCountry!,
      cardType: CardUtils.detectCardType(
          cardNumber: cardNumberController.text.trim()),
      cardHolderName: cardHolderNameController.text.trim(),
      expiryDate: expiryDateController.text.trim(),
    );

    context.read<CreditCardBloc>().add(OnAddCard(card: card));

    // Clear fields
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
