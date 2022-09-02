import 'dart:io';

/// Diese Methode kann abgerufen werden um den Internet zu testen
/// dies liefert true/false
Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
