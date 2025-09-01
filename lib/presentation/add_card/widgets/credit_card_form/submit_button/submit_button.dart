import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/submit_button/submit_button_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.cardNumberController,
    required this.cvvController,
    required this.selectedCountryCode,
    required this.selectedCountryName,
    required this.cardHolderNameController,
    required this.expiryDateController,
    required this.bannedCountryCodes,
  });

  final TextEditingController cardNumberController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;
  final TextEditingController expiryDateController;
  final String? selectedCountryCode;
  final String? selectedCountryName;
  final List<String> bannedCountryCodes;

  void _clearFields() {
    cardNumberController.clear();
    cvvController.clear();
    cardHolderNameController.clear();
    expiryDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final service =
        SubmitCreditCardService(bannedCountryCodes: bannedCountryCodes);

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
        onPressed: () {
          if (selectedCountryCode == null || selectedCountryName == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a country.')),
            );
            return;
          }

          service.submitCard(
            context: context,
            cardHolderName: cardHolderNameController.text,
            cardNumber: cardNumberController.text,
            cvv: cvvController.text,
            expiryDate: expiryDateController.text,
            countryName: selectedCountryName!,
            countryCode: selectedCountryCode!,
          );
        },
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
