import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/card_holder_name.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/cvv_field.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/expiry_date_field.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/scan_card_button.dart';
import 'package:flutter/material.dart';
import 'card_number_field.dart';
import 'issuing_country_field.dart';
import 'submit_button.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({super.key});

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  String? _selectedCountry;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _onCountryChanged(String? value) =>
      setState(() => _selectedCountry = value);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: Material(
            elevation: 9,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(24),
              width: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardHolderNameField(controller: _cardHolderNameController),
                    const SizedBox(height: 12),
                    CardNumberField(controller: _cardNumberController),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CvvField(
                            controller: _cvvController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: IssuingCountryField(
                            selectedCountry: _selectedCountry,
                            onChanged: _onCountryChanged,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ExpiryDateField(controller: _expiryDateController),
                    const SizedBox(height: 16),
                    SubmitButton(
                      formKey: _formKey,
                      cardNumberController: _cardNumberController,
                      cvvController: _cvvController,
                      selectedCountry: _selectedCountry,
                      cardHolderNameController: _cardHolderNameController,
                      expiryDateController: _expiryDateController,
                    ),
                    const SizedBox(height: 12),
                    ScanCardButton(
                      cardNumberController: _cardNumberController,
                      cardHolderNameController: _cardHolderNameController,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
