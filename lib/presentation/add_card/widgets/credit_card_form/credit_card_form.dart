import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/card_holder_name.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/cvv_field.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/expiry_date_field.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/scan_card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'card_number_field.dart';
import 'issuing_country_field.dart';
import 'submit_button/submit_button.dart';

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

  String? _selectedCountryCode;
  String? _selectedCountryName;
  List<String> bannedCountryCodes = [];

  @override
  void initState() {
    super.initState();
    final bloc = context.read<CreditCardBloc>();
    if (bloc.state.countries.isEmpty) {
      bloc.add(const CreditCardEvent.onGetCountries());
    }
    _loadBannedCountries();
  }

  Future<void> _loadBannedCountries() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bannedCountryCodes = prefs.getStringList('bannedCountries') ?? [];
    });
  }

  void _onCountryChanged(String? code, String? name) {
    setState(() {
      _selectedCountryCode = code;
      _selectedCountryName = name;
    });
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black.withOpacity(0.5)),
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
                        Expanded(child: CvvField(controller: _cvvController)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: IssuingCountryField(
                            selectedCountryCode: _selectedCountryCode,
                            selectedCountryName: _selectedCountryName,
                            onChanged: _onCountryChanged,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ExpiryDateField(controller: _expiryDateController),
                    const SizedBox(height: 16),
                    SubmitButton(
                      cardNumberController: _cardNumberController,
                      cvvController: _cvvController,
                      selectedCountryCode: _selectedCountryCode,
                      selectedCountryName: _selectedCountryName,
                      cardHolderNameController: _cardHolderNameController,
                      expiryDateController: _expiryDateController,
                      bannedCountryCodes: bannedCountryCodes,
                    ),
                    const SizedBox(height: 12),
                    ScanCardButton(
                      cardNumberController: _cardNumberController,
                      cardHolderNameController: _cardHolderNameController,
                    ),
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
