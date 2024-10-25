import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._internal();

  static final SharedPreference instance = SharedPreference._internal();
  late final SharedPreferencesAsync _preferences;

  static const String isRegDoneKey = 'is_reg_done';

  void initPreference() {
    _preferences = SharedPreferencesAsync();
  }

  Future<void> updateIsRegDone(bool isRegDone) async {
    await _preferences.setBool(isRegDoneKey, isRegDone);
  }

  Future<bool?> isRegDone() {
    return _preferences.getBool(isRegDoneKey);
  }
}
