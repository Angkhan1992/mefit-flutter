import 'package:shared_preferences/shared_preferences.dart';

const keyTheme = 'app-theme';
const keyToken = 'app-token';

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

  Future<bool> setTheme(int flag) async {
    final prefs = await _prefs;
    return await prefs.setInt(keyTheme, flag);
  }

  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(keyToken);
  }

  Future<bool> setToken(String token) async {
    final prefs = await _prefs;
    return await prefs.setString(keyToken, token);
  }
}
