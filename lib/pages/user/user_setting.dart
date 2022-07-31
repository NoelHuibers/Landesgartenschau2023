// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';

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
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController return_passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: SingleChildScrollView(
            child: SizedBox(
                child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildImageLogo(
                        context, "assets/images/kontoImage.png", 100, 100),
                    SizedBox(height: 10.h),
                    Text(
                      'Persönliche Daten!',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    usertext_build(),
                    SizedBox(height: 5.h),
                    buildPassword(
                        "altes Passwort", old_password, oldPassController),
                    SizedBox(height: 5.h),
                    buildPassword(
                        "neues Passwort", new_password, passController),
                    SizedBox(height: 5.h),
                    buildPassword("neues Passwort wiederholen", return_password,
                        return_passController),
                    SizedBox(height: 20.h),
                    buildButton("Passwort ändern", test, 250, 20, 15, context),
                    SizedBox(height: 5.h),
                    buildButton("Abmelden", test, 250, 20, 15, context),
                    SizedBox(height: 20.h),
                    Text(
                      '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ));
  }

  Widget usertext_build() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                // border:
                //     Border.all(color: Theme.of(context).colorScheme.onPrimary),
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

  void test() {}
}
