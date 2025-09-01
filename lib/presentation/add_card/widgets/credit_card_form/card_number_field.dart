import 'package:cardwiz/core/utils/card_validator_service.dart';
import 'package:cardwiz/core/utils/credit_card_number_formatter.dart';
import 'package:cardwiz/presentation/add_card/widgets/cardwiz_textfield.dart';
import 'package:flutter/material.dart';

class CardNumberField extends StatelessWidget {
  const CardNumberField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CardWizTextField(
      label: 'Card Number',
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) => CardValidatorService.validateCardNumber(value),
      inputFormatters: [
        CreditCardNumberFormatter(
          sample: "xxxx-xxxx-xxxx-xxxx",
          separator: "-",
        )
      ],
    );
  }
}
