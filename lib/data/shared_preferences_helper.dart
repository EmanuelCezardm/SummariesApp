import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<SharedPreferences> get _getInstance => SharedPreferences.getInstance();

  setUser(bool status, String email, String password) async {
    SharedPreferences instance = await _getInstance;
    await instance.setBool('USERLOGGED', status);
    await instance.setString('USEREMAIL', email);
    await instance.setString('USERPASSWORD', password);
  }

  getUser() async {
    SharedPreferences instance = await _getInstance;
    bool? userLogged = instance.getBool('USERLOGGED');
    String? userEmail = instance.getString('USEREMAIL');
    String? userPassword = instance.getString('USERPASSWORD');

    Map user = {};

    if (userLogged == null) {
      user['USERLOGGED'] = false;
      user['USEREMAIL'] = '';
      user['USERPASSWORD'] = '';
      return user;
    }

    user['USERLOGGED'] = userLogged;
    user['USEREMAIL'] = userEmail;
    user['USERPASSWORD'] = userPassword;

    return user;
  }
}
