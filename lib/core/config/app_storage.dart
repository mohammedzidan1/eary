import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AppStorage {
  static const _appBoxName = 'appBox';
  static const _themeMode = 'theme_mode';
  static const _locale = 'locale';
  static const _defaultLocale = 'en';
  static final Box _appBox = Hive.box(_appBoxName);

  static init() async {
    await Hive.initFlutter();
    await Hive.openBox(_appBoxName);
  }

  static ValueListenable appBoxListener() {
    return _appBox.listenable(keys: [_themeMode, _locale]);
  }

  static ThemeMode getThemeMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    String mode =
        isDarkMode ? ThemeMode.dark.toString() : ThemeMode.light.toString();
    mode = _appBox.get(_themeMode, defaultValue: mode);

    return ThemeMode.values.firstWhere((element) => element.toString() == mode);
  }

  static setThemeMode(ThemeMode themeMode) async {
    await _appBox.put(_themeMode, themeMode.toString());
  }

  static setLocale(String locale) async {
    await _appBox.put(_locale, locale);
  }

  static String getLocale() {
    return _appBox.get(_locale, defaultValue: _defaultLocale);
  }
}
