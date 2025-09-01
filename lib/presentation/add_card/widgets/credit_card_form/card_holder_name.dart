import 'package:cardwiz/core/utils/card_validator_service.dart';
import 'package:cardwiz/presentation/add_card/widgets/cardwiz_textfield.dart';
import 'package:flutter/material.dart';

class CardHolderNameField extends StatelessWidget {
  const CardHolderNameField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CardWizTextField(
      label: 'Cardholder Name',
      controller: controller,
      validator: CardValidatorService.validateName,
    );
  }
}
