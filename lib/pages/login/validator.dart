/*
Die Datei ist für das Überprüfen der Passwörter,
ob die eingegebenen Passwörter die Eigenschaften besitzen,
die wir geplant haben
*/

class Validator {
  static String? validateUser(String value) {
    Pattern pattern =
        r'^(?=.{6,200}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '    ihre 6 bis 200 stellig username eingeben';
    } else {
      return null;
    }
  }

  static String? validatePassword(String pass, String returnPass, String text) {
    Pattern pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern as String);

    ///Überprüft,ob die Passswörter übereinstimmen
    /// ob die Fehler leer sind
    /// ob die eingegebenen Passwörter die Eigenschaften erfüllen

    if (pass != returnPass && returnPass != pass) {
      return '    Die Passwörter Stimmen nicht überein';
    } else if (pass.isEmpty || returnPass.isEmpty) {
      return text;
    } else if (!regex.hasMatch(pass) && !regex.hasMatch(returnPass)) {
      return '    Bitte geben sie 6 bis 200 stellige Passwort ein';
    } else {
      return null;
    }
  }

  static String? validatePass(String pass) {
    if (pass.isEmpty) {
      return '    geben sie ihre altes Passwort ein';
    } else {
      return null;
    }
  }
}
