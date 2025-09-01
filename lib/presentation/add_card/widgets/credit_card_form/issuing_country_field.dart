import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuingCountryField extends StatelessWidget {
  const IssuingCountryField({
    super.key,
    required this.selectedCountryCode,
    required this.selectedCountryName,
    required this.onChanged,
  });

  final String? selectedCountryCode;
  final String? selectedCountryName;
  final void Function(String?, String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditCardBloc, CreditCardState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final countries = state.countries;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Issuing Country",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedCountryCode,
              isExpanded: true,
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              items: countries.map((c) {
                return DropdownMenuItem<String>(
                  value: c.code,
                  child:
                      Text(c.name, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
              onChanged: (code) {
                if (code == null) return;
                final country = countries.firstWhere((c) => c.code == code,
                    orElse: () => countries.first);
                onChanged(country.code, country.name);
              },
            ),
          ],
        );
      },
    );
  }
}
