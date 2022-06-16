import 'dart:convert';
import 'package:http/http.dart' as http;

import '/models/eventslist.dart';

Future<Happenings> fetchData() async {
  final response =
      await http.get(Uri.parse('https://api.pwi-2022.org/happenings/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Happenings.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
