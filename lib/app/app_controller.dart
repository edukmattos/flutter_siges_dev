import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _AppControllerBase() {
    _prefThemeLoad();
  }

  @observable
  ThemeData themeData;

  @computed
  bool get isDark => themeData.brightness == Brightness.dark;

  @action
  void themeChange() {
    if (isDark) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
    print(isDark);
    _prefThemeSave();
  }

  Future<void> _prefThemeSave() async {
    print(isDark);
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("isDark", isDark);
  }

  //void _prefThemeSave() {
  //  SharedPreferences.getInstance().then((instance) {
  //    instance.setBool('isDark', isDark);
  //  });
  //}

  Future<void> _prefThemeLoad() async {
    final SharedPreferences prefs = await _prefs;

    print(prefs.containsKey('isDark'));
    print(prefs.getBool('isDark'));

    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeData = ThemeData.dark();
      print("dark");
    } else {
      themeData = ThemeData.light();
      print("light");
    }
  }
}
