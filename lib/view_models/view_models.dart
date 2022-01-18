import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModel extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  Future<bool?> getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getBool('isDark');
  }

  setPref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', value);
    prefs.reload();
  }

  setToDark() async {
    await getPref().then((value) => _isDark = value??false);
    notifyListeners();
  }
}