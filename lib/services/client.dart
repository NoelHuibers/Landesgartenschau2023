import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/data.dart';

Future<Data> fetchData() async {
  final response = await http.get(Uri.parse('https://IP:port/api/data'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Data.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
