import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._internal();

  static final SharedPreference instance = SharedPreference._internal();
  late final SharedPreferencesAsync _preferences;

  static const String isRegDoneKey = 'is_reg_done';
  static const String nameKey = 'name';
  static const String ageKey = 'age';
  static const String genderKey = 'gender';
  static const String dietaryPreferenceKey = 'dietary_preference';

  void initPreference() {
    _preferences = SharedPreferencesAsync();
  }

  Future<void> updateIsRegDone(bool isRegDone) async {
    await _preferences.setBool(isRegDoneKey, isRegDone);
  }

  Future<bool?> isRegDone() {
    return _preferences.getBool(isRegDoneKey);
  }

  Future<void> updateName(String name) async {
    await _preferences.setString(nameKey, name);
  }

  Future<String?> name() {
    return _preferences.getString(nameKey);
  }
}
