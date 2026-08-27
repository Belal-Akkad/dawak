import 'package:shared_preferences/shared_preferences.dart';

abstract final class OnboardingStorage {
  OnboardingStorage._();

  static const String _key = 'has_seen_onboarding';

  static Future<bool> isCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> setCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
