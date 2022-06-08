class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Bitte gültigen E-Mail geben';
    } else {
      return null;
    }
  }

  static String? validatePassword(String pass, String retrun_pass) {
    /*
    Das Paswort muss: 
    . min 1 Buchstabe
    . min 1 Zahl
    . Das passwort muss aus 6 zeichen lang sein
    */
    Pattern pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern as String);

    if (pass != retrun_pass || retrun_pass != pass) {
      return 'Die Passwörter Stimmen nicht überein';
    } else if (pass.isEmpty || retrun_pass.isEmpty) {
      return 'Bitte passwort in beiden feldern eigeben ';
    } else if (!regex.hasMatch(pass) && !regex.hasMatch(retrun_pass)) {
      return 'Bitte geben sie ein Gültiges Pass ein';
    } else {
      return null;
    }
  }
}
