import 'package:cardwiz/core/utils/validator_service.dart';
import 'package:cardwiz/presentation/add_card/widgets/cardwiz_textfield.dart';
import 'package:flutter/material.dart';

class ExpiryDateField extends StatelessWidget {
  const ExpiryDateField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CardWizTextField(
      label: 'Expiry Date (MM/YY)',
      controller: controller,
      keyboardType: TextInputType.datetime,
      maxLength: 5,
      validator: ValidatorService.validateExpiryDate,
    );
  }
}
