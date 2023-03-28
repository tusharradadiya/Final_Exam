import 'package:shared_preferences/shared_preferences.dart';

class Sharedhelper {
  Sharedhelper._();

  static Sharedhelper sharedhelper = Sharedhelper._();


  Future<void> insretData(String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', email);
    sharedPreferences.setString('password', password);
  }
  Future<void> isLogin(bool boolian) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('islogin', boolian);
  }
  Future<bool?> readLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? islogin= sharedPreferences.getBool('islogin');
    return islogin;
  }

  Future<Map<String, String?>> readData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? email = sharedPreferences.get('email') as String?;
    String? password = sharedPreferences.get('password') as String?;
    return {'email':email,'password':password};
  }
}
