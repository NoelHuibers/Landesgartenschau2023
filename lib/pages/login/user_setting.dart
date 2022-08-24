// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import '/services/client.dart' as client;
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'package:landesgartenschau2023/pages/login/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  bool _showPassword = true;
  String old_password = '';
  String new_password = '';
  String return_password = '';
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController return_passController = TextEditingController();

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
        return_passController.clear();
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
      routeToPage(context, const Homepage());
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onBackground),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                if (prefs.getString("login") != null) {
                  routeToPage(context, const Homepage());
                } else {
                  return;
                }
              }),
          centerTitle: true,
          title: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Image.asset("assets/images/logo6.png"),
          ),
        ),
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
                              buildImageLogo(context,
                                  "assets/images/kontoImage.png", 100, 100),
                              SizedBox(height: 10.h),
                              Text(
                                'Persönliche Daten!',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.h),
                              usertext_build(),
                              SizedBox(height: 5.h),
                              buildOldPassword("altes Passwort", old_password,
                                  oldPassController),
                              SizedBox(height: 5.h),
                              buildPassword("neues Passwort", new_password,
                                  passController),
                              SizedBox(height: 5.h),
                              buildPassword("neues Passwort wiederholen",
                                  return_password, return_passController),
                              SizedBox(height: 20.h),
                              buildButton("Passwort ändern", setPass, 250, 20,
                                  15, context),
                              SizedBox(height: 5.h),
                              buildButton(
                                  "Abmelden", logout, 250, 20, 15, context),
                              SizedBox(height: 20.h),
                              Text(
                                '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  )
                ])))));
  }

  Widget usertext_build() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                  width: 40.0,
                  child: Align(
                    alignment: const Alignment(0.5, 0.6),
                    child: Icon(
                      Icons.email,
                      size: 25.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 24.0),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    "username: ",
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

  Widget buildPassword(
      String text, String pass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: controller,
              validator: (value) {
                return Validator.validatePassword(value!, pass);
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
                  Icons.lock_open_outlined,
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

  Widget buildOldPassword(
      String text, String pass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: controller,
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
                  Icons.lock_open_outlined,
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

  // setUserName() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   username = prefs.getString("username").toString();
  //   return prefs.getString("username").toString();
  // }
}
