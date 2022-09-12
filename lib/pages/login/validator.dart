import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Überprüfen der Passwörter,
ob die eingegebenen Passwörter die Eigenschaften besitzen,
die wir geplant haben
*/

class Validator {
  static String? validateUser(String value, context) {
    Pattern pattern =
        r'^(?=.{6,200}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '    ${AppLocalizations.of(context)!.characterusername}';
    } else {
      return null;
    }
  }

  static String? validatePassword(
      String pass, String returnPass, String text, context) {
    Pattern pattern = r'^(?=.*?[A-Za-z]).{6,200}$';
    RegExp regex = RegExp(pattern as String);

    ///Überprüft,ob die Passswörter übereinstimmen
    /// ob die Fehler leer sind
    /// ob die eingegebenen Passwörter die Eigenschaften erfüllen

    if (pass != returnPass && returnPass != pass) {
      return '    ${AppLocalizations.of(context)!.passwordNotMatch}';
    } else if (pass.isEmpty || returnPass.isEmpty) {
      return text;
    } else if (!regex.hasMatch(pass) && !regex.hasMatch(returnPass)) {
      return '    ${AppLocalizations.of(context)!.passwordlength}';
    } else {
      return null;
    }
  }

  static String? validatePass(String pass, context) {
    if (pass.isEmpty) {
      return '    ${AppLocalizations.of(context)!.enterPassword}';
    } else {
      return null;
    }
  }
}
