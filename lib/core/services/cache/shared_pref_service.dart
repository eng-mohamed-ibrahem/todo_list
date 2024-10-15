import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  factory SharedPrefService() => _instance;
  SharedPrefService._();
  static final SharedPrefService _instance = SharedPrefService._();
  late final SharedPreferences _prefs;
  Future<void> initService() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveValueInList(
      {required String listKey, required String value}) async {
    await _prefs.setStringList(
      listKey,
      [...?_prefs.getStringList(listKey), value],
    );
  }

  Future<void> saveList(
      {required String listKey, required List<String> list}) async {
    await _prefs.setStringList(listKey, list);
  }

  Future<List<String>> getList({required String listKey}) async {
    return _prefs.getStringList(listKey) ?? [];
  }

  Future<void> saveValue({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  Future<dynamic> getValue({required String key}) async {
    return _prefs.get(key);
  }
}
