import 'package:cardwiz/core/utils/validator_service.dart';
import 'package:cardwiz/presentation/add_card/widgets/cardwiz_textfield.dart';
import 'package:flutter/material.dart';

class CvvField extends StatelessWidget {
  const CvvField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CardWizTextField(
      label: 'CVV',
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 4,
      obscureText: true,
      validator: ValidatorService.validateCvv,
    );
  }
}
