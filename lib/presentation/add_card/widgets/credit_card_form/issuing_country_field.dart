import 'package:cardwiz/core/utils/validator_service.dart';
import 'package:flutter/material.dart';

class IssuingCountryField extends StatelessWidget {
  const IssuingCountryField({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  final String? selectedCountry;
  final void Function(String?) onChanged;

  final List<String> _countries = const [
    'USA',
    'UK',
    'Canada',
    'Australia',
    'Germany',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      decoration: InputDecoration(
        labelText: 'Issuing Country',
        filled: true,
        fillColor: const Color(0xFF1C1C1C),
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: const Color(0xFF101820),
      items: _countries
          .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c, style: const TextStyle(color: Colors.white)),
              ))
          .toList(),
      onChanged: onChanged,
      validator: ValidatorService.validateIssuingCountry,
    );
  }
}
