import 'dart:convert';

import 'package:http/http.dart' as http;

import '/models/events/happeningsversion.dart';

Future<HappeningsVersion> fetchData() async {
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
