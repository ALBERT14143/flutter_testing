import 'package:http/http.dart' as http;
import 'package:test_login_api/model/user_response.dart';

class ApiAuthorization{

  Future<UserResponse> login(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse("http://172.16.0.11:333/WebService/Account/Login?username=$username&password=$password")
      );
      if (response.statusCode != 200) {
        throw Exception("Something went wrong!");
      }

      return UserResponse.fromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }
}

