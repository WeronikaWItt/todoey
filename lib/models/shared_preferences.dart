import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences preferences;

  static const _keyTitle = 'taskTitle';
  static const _keyDescription = 'description';
  static const _keyID = 'id';
  static const _keyIsDone = 'isDone';

  static Future init() async => preferences = await SharedPreferences.getInstance();

  static Future setTitle(String taskTitle) async => await preferences.setString(_keyTitle, taskTitle);
  static String getTitle() => preferences.getString(_keyTitle);

  static Future setDescription(String description) async => await preferences.setString(_keyDescription, description);
  static String getDescription() => preferences.getString(_keyDescription);

  static Future setId(String id) async => await preferences.setString(_keyID, id);
  static String getId() => preferences.getString(_keyID);

  static Future setIsDone(bool isDone) async => await preferences.setBool(_keyIsDone, isDone);
  static bool getIsDone() => preferences.getBool(_keyIsDone);
}
