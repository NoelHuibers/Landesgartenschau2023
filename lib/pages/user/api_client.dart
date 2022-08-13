// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
/* 
Dies handelt sich um FakeAPI call
In der Login Page folgendes eingeben um zu testen 
E-mail: eve.holt@reqres.in
Pass: cityslicka 
Hinweis: der Token wird auch bei flaschen pass von server gesendet
(!!!Email muss richtig sein!!!)
*/

class ApiCall {
  Future<dynamic> login(String username, String password) async {
    var response = await http.post(
        Uri.parse("https://api.pwi-2022.org/users/login"),
        body: ({"event_id": '12', "name": username, "password": password}));
    return response;
  }

  Future<dynamic> register(String username, String password) async {
    var response = await http.post(Uri.parse("https://api.pwi-2022.org/users"),
        body: ({"name": "THowde5", "password": "semonas123"}));
    print(response.statusCode);
    print(response.toString());
    return response;
  }

  Future<dynamic> resetPass(String username, String password) async {
    var response = await http.post(
        Uri.parse("https://api.pwi-2022.org/users/logout"),
        body: ({
          "name": "user123",
          "new_password": "1234567",
          "password": "123456"
        }));
    return response;
  }

  Future<dynamic> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("login");

    var response = await http.post(
        Uri.parse("https://api.pwi-2022.org/users/changepw"),
        body: ({"Token": prefs.getString("login")}));

    return response;
  }
}
