import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PreferenceStorage {
  Future<String?> getString(String key);
  Future<bool?> getBool(String key);
  Future<List<String>?> getStringList(String key);
  Future<void> setString(String key, String value);
  Future<void> setBool(String key, {required bool value});
  Future<void> setStringList(String key, List<String> value);
  Future<void> clear(Set<String> keys);
}

class SharedPreferencesStorage implements PreferenceStorage {
  SharedPreferencesStorage([SharedPreferencesAsync? preferences])
    : _preferences = preferences ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _preferences;

  @override
  Future<bool?> getBool(String key) => _preferences.getBool(key);

  @override
  Future<String?> getString(String key) => _preferences.getString(key);

  @override
  Future<List<String>?> getStringList(String key) {
    return _preferences.getStringList(key);
  }

  @override
  Future<void> setBool(String key, {required bool value}) {
    return _preferences.setBool(key, value);
  }

  @override
  Future<void> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  @override
  Future<void> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  @override
  Future<void> clear(Set<String> keys) {
    return _preferences.clear(allowList: keys);
  }
}

class MemoryPreferenceStorage implements PreferenceStorage {
  MemoryPreferenceStorage([Map<String, Object>? values])
    : _values = <String, Object>{...?values};

  final Map<String, Object> _values;

  Map<String, Object> get values => Map<String, Object>.unmodifiable(_values);

  @override
  Future<bool?> getBool(String key) async => _values[key] as bool?;

  @override
  Future<String?> getString(String key) async => _values[key] as String?;

  @override
  Future<List<String>?> getStringList(String key) async {
    final value = _values[key];
    return value is List<String> ? List<String>.of(value) : null;
  }

  @override
  Future<void> setBool(String key, {required bool value}) async {
    _values[key] = value;
  }

  @override
  Future<void> setString(String key, String value) async {
    _values[key] = value;
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    _values[key] = List<String>.of(value);
  }

  @override
  Future<void> clear(Set<String> keys) async {
    _values.removeWhere((key, value) => keys.contains(key));
  }
}
