import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';
import 'package:landesgartenschau2023/pages/login/user_setting.dart';
import 'package:landesgartenschau2023/pages/login/validator.dart';
import '/services/client.dart' as client;
import 'package:landesgartenschau2023/pages/register.dart';
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden der Login Page,
wo der User sich anmelden kann
*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _showPassword = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      Response res = await client.login(
        userController.text,
        passController.text,
      );

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("login", body['token']);
        await prefs.setString("username", userController.text);
        routeToPage(context, const UserSetting());
      }
      if (res.statusCode == 400) {
        massage(context, 'Fehler ist aufgetreten');
        return;
      }
      if (res.statusCode == 401) {
        massage(context, 'Passwort oder username falsch');
        return;
      }
      if (res.statusCode == 404) {
        massage(context, 'user nicht gefunden');
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 10.h),
                              buildImageLogo(context,
                                  "assets/images/kontoImage.png", 100, 100),
                              SizedBox(height: 10.h),
                              buildText(context,
                                  AppLocalizations.of(context)!.login, 20),
                              SizedBox(height: 30.h),
                              DefaultCard(
                                  child: buildUser(context, userController)),
                              SizedBox(height: 10.h),
                              DefaultCard(
                                  child: buildPassword(passController.text)),
                              SizedBox(height: 20.h),
                              buildButton(AppLocalizations.of(context)!.login,
                                  login, 250, 20, 15, context),
                              SizedBox(height: 130.h),
                              buildButton("Du hast noch kein Konto",
                                  registerNavigate, 150, 10, 10, context),
                              buildText(
                                  context,
                                  '© Landesgartenschau Höxter 2023 GmbH \n                   ${AppLocalizations.of(context)!.allrightsreserved}',
                                  10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ])))));
  }

  void registerNavigate() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  ///Bildet den Passwort-Eingabebereich
  ///in der Login Page
  Widget buildPassword(String pass) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
            alignment: Alignment.center,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: passController,
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
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }
}
