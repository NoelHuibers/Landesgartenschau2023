import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:landesgartenschau2023/models/stands/standsversion.dart';
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

Future<StandsVersion> fetchStands() async {
  final response =
      await http.get(Uri.parse('https://api.pwi-2022.org/events/1/stands'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return StandsVersion.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

/// Dies dient um Angabedaten an Servern zu senden
/// nimmt [username],[password]
/// dies wird fürs Login verwendet
Future<dynamic> login(String username, String password) async {
  final response =
      await http.post(Uri.parse("https://api.pwi-2022.org/users/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'event_id': "1",
            'name': username,
            'password': password,
          }));
  return response;
}

/// Dies dient um Angabedaten an Servern zu senden
/// nimmt [username],[password]
/// dies wird fürs registrieren verwendet
Future<dynamic> register(String username, String password) async {
  final response = await http.post(Uri.parse("https://api.pwi-2022.org/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': username,
        'password': password,
      }));
  return response;
}

/// Dies dient um Angabedaten an Servern zu senden
/// nimmt [username],[password]
/// dies wird für die Passwort-Zurücksetzung verwendet
Future<dynamic> resetPass(
    String username, String password, String oldPassword) async {
  final response = await http.put(
      Uri.parse("https://api.pwi-2022.org/users/changepw"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": username,
        "new_password": password,
        "password": oldPassword
      }));
  return response;
}

/// Dies dient um den token an Server zu senden
/// nimmt [token]
/// dies wird für das Ausloggen verwendet
Future<dynamic> logOut(String token) async {
  final response = await http.post(
      Uri.parse("https://api.pwi-2022.org/users/logout"),
      headers: <String, String>{
        'token': token,
      });
  return response;
}
