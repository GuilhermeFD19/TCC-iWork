import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AuthProvider {
  static Future<bool> getToken() async {
    print("ola mundo");
    try {
      Directory path = await getApplicationDocumentsDirectory();

      var box = await Hive.openBox('token', path: path.path);

      return box.get('isLogged');
    } catch (e) {
      return false;
    }
  }

  static setToken(
    bool value,
  ) async {
    try {
      Directory path = await getApplicationDocumentsDirectory();

      var box = await Hive.openBox('token', path: path.path);
      await box.put('isLogged', value);
    } catch (e) {}
  }
}
