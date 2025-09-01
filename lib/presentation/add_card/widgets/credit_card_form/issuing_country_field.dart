import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuingCountryField extends StatelessWidget {
  const IssuingCountryField({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  final String? selectedCountry;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    context.read<CreditCardBloc>().add(const CreditCardEvent.onGetCountries());

    return BlocBuilder<CreditCardBloc, CreditCardState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<String> countryNames =
            state.countries.map((c) => c.name).toList();

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
              value: selectedCountry,
              isExpanded: true,
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.greenAccent, width: 2),
                ),
              ),
              items: countryNames
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(
                        c,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
            if (state.failure != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Failed to load countries",
                  style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
