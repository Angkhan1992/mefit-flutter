import 'package:shared_preferences/shared_preferences.dart';

const keyTheme = 'app-theme';

class PrefService {
  static PrefService? _preferenceService;
  static PrefService get instance => _preferenceService ?? PrefService();
  PrefService() {
    _preferenceService = this;
  }

  final _prefs = SharedPreferences.getInstance();

  Future<int> getTheme() async {
    final prefs = await _prefs;
    return prefs.getInt(keyTheme) ?? 0;
  }

  Future<void> setTheme(int flag) async {
    final prefs = await _prefs;
    await prefs.setInt(keyTheme, flag);
  }
}
