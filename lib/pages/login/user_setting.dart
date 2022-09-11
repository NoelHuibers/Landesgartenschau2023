import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';
import 'package:landesgartenschau2023/pages/login.dart';
import '/services/client.dart' as client;
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'package:landesgartenschau2023/pages/login/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden der User Page
dh. nachdem der User sich angemeldet hat 
*/

class UserSetting extends StatefulWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  bool _showPassword = true;
  String oldPassword = '';
  String newPassword = '';
  String returnPassword = '';
  String userName = "";
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController returnPassController = TextEditingController();

  Future<void> setPass() async {
    if (_formKey.currentState!.validate()) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Response res = await client.resetPass(
          prefs.getString("username").toString(),
          passController.text,
          oldPassController.text);

      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwort wurde geändert'),
          backgroundColor: Colors.green,
        ));
        passController.clear();
        oldPassController.clear();
        returnPassController.clear();
      }
      if (res.statusCode == 401) {
        massage(context, 'falsche angegebene Passwort');
      }
    }
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Response res = await client.logOut(
      prefs.getString("login").toString(),
    );
    if (res.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("login");
      prefs.remove("username");
      routeToPage(context, const LoginScreen());
    }
    if (res.statusCode == 400) {
      massage(context, 'Fehler mit Token');
    }
    if (res.statusCode == 401) {
      massage(context, 'melde dich zuerst an');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: buildAppBar(context, const Homepage()),
            body: Form(
                key: _formKey,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.light,
                    child: GestureDetector(
                        child: Stack(children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary),
                        child: SingleChildScrollView(
                          child: SizedBox(
                              child: SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20.h),
                                  Text(
                                    AppLocalizations.of(context)!.personaldata,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20.h),
                                  DefaultCard(
                                    child: usertextBuild(),
                                  ),
                                  SizedBox(height: 5.h),
                                  DefaultCard(
                                    child: buildOldPassword("altes Passwort",
                                        oldPassword, oldPassController),
                                  ),
                                  SizedBox(height: 5.h),
                                  DefaultCard(
                                    child: buildPassword("neues Passwort",
                                        newPassword, passController),
                                  ),
                                  SizedBox(height: 5.h),
                                  DefaultCard(
                                    child: buildPassword(
                                        AppLocalizations.of(context)!
                                            .repeatpassword,
                                        returnPassword,
                                        returnPassController),
                                  ),
                                  SizedBox(height: 100.h),
                                  buildButton(
                                      AppLocalizations.of(context)!
                                          .changepassword,
                                      setPass,
                                      200,
                                      15,
                                      15,
                                      context),
                                  SizedBox(height: 5.h),
                                  buildButton(
                                      AppLocalizations.of(context)!.logout,
                                      logout,
                                      150,
                                      10,
                                      15,
                                      context),
                                  SizedBox(height: 30.h),
                                  Text(
                                    '© Landesgartenschau Höxter 2023 GmbH \n                   ${AppLocalizations.of(context)!.allrightsreserved}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ),
                      )
                    ]))))));
  }

  ///Bildet die User name in der User Page
  Widget usertextBuild() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 7),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 43.0,
                  width: 40.0,
                  child: Align(
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 25.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    AppLocalizations.of(context)!.username,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]);
  }

  ///Bildet den Passwort-Eingabebereich
  ///für die Eingabe der neuen Passwörter
  ///in der User Page
  Widget buildPassword(
      String text, String pass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: controller,
              validator: (value) {
                return Validator.validatePassword(value!, pass,
                    '    Bitte passwort in beiden feldern eigeben ');
              },
              onChanged: (value) => pass = value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  _showPassword ? Icons.lock_open_outlined : Icons.lock_outline,
                  size: 23,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                hintText: text,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }

  ///Bildet die passwort eingabe bereich
  ///für die eingabe die alte passwort
  ///in der User Page
  Widget buildOldPassword(
      String text, String pass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: controller,
              validator: (value) {
                return Validator.validatePass(value!);
              },
              onChanged: (value) => pass = value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  _showPassword ? Icons.lock_open_outlined : Icons.lock_outline,
                  size: 23,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                hintText: text,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }

  // Future<String> setUserName() async {
  //   return Future.delayed(const Duration(seconds: 2)).then((value) async {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     userName = prefs.getString("username").toString();
  //     return userName;
  //   }, onError: (error, stackTrace) {
  //     return "failed";
  //   });
  // }

  Future<bool> _onBackPressed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("login") != null) {
      routeToPage(context, const Homepage());
    }
    if (prefs.getString("login") == null) {
      routeToPage(context, const LoginScreen());
    }
    return false;
  }
}
