import 'package:shared_preferences/shared_preferences.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';

class BannedCountriesService {
  static const _prefsKey = "bannedCountries";

  Future<List<String>> loadBannedCountries() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_prefsKey) ?? [];
  }

  Future<void> saveBannedCountries(List<String> codes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, codes);
  }

  Future<void> toggleCountry(
      CountryDto country, List<String> currentCodes) async {
    final codes = List<String>.from(currentCodes);
    if (codes.contains(country.code)) {
      codes.remove(country.code);
    } else {
      codes.add(country.code);
    }
    await saveBannedCountries(codes);
  }

  bool isCountryBanned(CountryDto country, List<String> codes) {
    return codes.contains(country.code);
  }
}
