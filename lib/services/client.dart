import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/models/events/happeningsversion.dart';

Future<HappeningsVersion> fetchHappenings() async {
  final response =
      await http.get(Uri.parse('https://api.pwi-2022.org/events/1/happenings'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return HappeningsVersion.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

Future<dynamic> login(String username, String password) async {
  var response = await http.post(
      Uri.parse("https://api.pwi-2022.org/users/login"),
      body: ({"event_id": '12', "name": username, "password": password}));
  return response;
}

Future<dynamic> register(String username, String password) async {
  final response = await http.post(Uri.parse("https://api.pwi-2022.org/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': username,
        'password': password,
      }));
  if (response.statusCode == 201) {
    return response;
  } else {
    throw Exception('User already exists');
  }
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
