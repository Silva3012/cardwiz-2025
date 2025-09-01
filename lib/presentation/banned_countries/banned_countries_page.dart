import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'banned_countries_service.dart';

@RoutePage()
class BannedCountriesPage extends StatefulWidget {
  const BannedCountriesPage({super.key});

  @override
  State<BannedCountriesPage> createState() => _BannedCountriesPageState();
}

class _BannedCountriesPageState extends State<BannedCountriesPage> {
  final _bannedCountriesService = BannedCountriesService();
  List<String> bannedCountryCodes = [];
  String? selectedCountryName;

  @override
  void initState() {
    super.initState();
    _loadBannedCountries();
    context.read<CreditCardBloc>().add(const CreditCardEvent.onGetCountries());
  }

  Future<void> _loadBannedCountries() async {
    final codes = await _bannedCountriesService.loadBannedCountries();
    setState(() => bannedCountryCodes = codes);
  }

  Future<void> _toggleBannedCountry(CountryDto country) async {
    await _bannedCountriesService.toggleCountry(country, bannedCountryCodes);
    _loadBannedCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        elevation: 0,
        title: const Text(
          "Banned Countries",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CreditCardBloc, CreditCardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.failure != null) {
            return const Center(
                child: Text("Failed to load countries",
                    style: TextStyle(color: Colors.red)));
          }

          final List<CountryDto> countries = state.countries;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  hint: const Text("Select a country"),
                  value: selectedCountryName,
                  isExpanded: true,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                  ),
                  items: countries.map((country) {
                    return DropdownMenuItem<String>(
                      value: country.name,
                      child: Text(
                        country.name,
                        style: TextStyle(
                          color: _bannedCountriesService.isCountryBanned(
                                  country, bannedCountryCodes)
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (name) {
                    if (name == null) return;
                    final country = countries.firstWhere((c) => c.name == name);
                    _toggleBannedCountry(country);
                    setState(() => selectedCountryName = null);
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Banned Countries",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: bannedCountryCodes.length,
                  itemBuilder: (context, index) {
                    final code = bannedCountryCodes[index];
                    final country = countries.firstWhere(
                      (c) => c.code == code,
                      orElse: () => CountryDto(name: code, code: code),
                    );
                    return Dismissible(
                      key: Key(country.code),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _toggleBannedCountry(country),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              country.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (_bannedCountriesService.isCountryBanned(
                                country, bannedCountryCodes))
                              const Icon(Icons.block, color: Colors.redAccent),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
