import '/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(User user) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('email', user.email!);
    _preferences.setString('password', user.password!);
  }

  Future<User> readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var name = _preferences.getString('name');
    var email = _preferences.getString('email');
    var password = _preferences.getString('password');
    return User(email: email, password: password);
  }

  Future removeCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('email');
    _preferences.remove('password');
    _preferences.remove('isLoggedIn');
  }

  Future logout() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('isLoggedIn');
  }

  Future authenticate() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('isLoggedIn', true);
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    if (_preferences.getBool('isLoggedIn') == true) {
      return true;
    } else {
      return false;
    }
  }
}
