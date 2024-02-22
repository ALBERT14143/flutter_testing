import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login_api/model/user_response.dart';

class SharedUser{
  static const userKey = "UserKey";

  Future<bool> checkUser() async {
    final shared = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    return shared.containsKey(userKey);
  }

  Future<bool> setUserData(Datum userdata) async {
    final shared = await SharedPreferences.getInstance();
    return await shared.setString(userKey, userdata.toJson());
  }

  Future<Datum> getUserData() async {
    final shared = await SharedPreferences.getInstance();
    var raw = shared.getString(userKey);
    return Datum.fromJson(raw!);
  }

  Future removeUserKey() async {
    final shared = await SharedPreferences.getInstance();
    return shared.remove(userKey);
  }
}