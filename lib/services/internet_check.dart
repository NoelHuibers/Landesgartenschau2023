// ignore_for_file: avoid_print

import 'dart:io';

//Dies Methode Kann abgerufen werden um den Internet zu testen
//dies liefert true/false
Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    print("Connection ist da");
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    print("Connection ist nicht da");
    return false;
  }
}
