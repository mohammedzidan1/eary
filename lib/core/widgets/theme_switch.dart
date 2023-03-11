import 'package:eary/core/config/app_storage.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  final bool _isDark = AppStorage.getThemeMode() == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isDark,
      activeColor: Colors.teal,
      onChanged: (bool value) {
        setState(() {
          if (_isDark == false) {
            AppStorage.setThemeMode(ThemeMode.dark);
          } else {
            AppStorage.setThemeMode(ThemeMode.light);
          }
        });
        Navigator.of(context).pop();
      },
    );
  }
}
