class Validator {
  static String? validateEmail(String value) {
    Pattern pattern =
        r'^(?=.{6,8}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Bitte gültigen E-Mail geben';
    } else {
      return null;
    }
  }

  static String? validatePassword(String pass, String returnPass) {
    /*
    Das Paswort muss: 
    . min 1 Buchstabe
    . min 1 Zahl
    . Das passwort muss aus 6 zeichen lang sein
    */
    Pattern pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern as String);

    if (pass != returnPass && returnPass != pass) {
      return 'Die Passwörter Stimmen nicht überein';
    } else if (pass.isEmpty || returnPass.isEmpty) {
      return 'Bitte passwort in beiden feldern eigeben ';
    } else if (!regex.hasMatch(pass) && !regex.hasMatch(returnPass)) {
      return 'Bitte geben sie ein Gültiges Pass ein';
    } else {
      return null;
    }
  }
}
