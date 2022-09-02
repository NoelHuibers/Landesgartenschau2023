import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import 'package:landesgartenschau2023/pages/login/user_setting.dart';
import 'package:landesgartenschau2023/pages/login/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/services/client.dart' as client;
import 'package:http/http.dart';

/*
Die Datei besteht aus allen Widgets, die 
in der Login, Register und User setting Pages 
verwendet wurden 
*/

///Bildet die App Bar
PreferredSizeWidget buildAppBar(BuildContext context, var seite) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.surfaceTint,
    leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: Theme.of(context).colorScheme.onBackground),
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          if (prefs.getString("login") != null) {
            routeToPage(context, const Homepage());
          }
          if (prefs.getString("login") == null) {
            routeToPage(context, const Homepage());
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
  );
}

/// Bildet die Buttons die in der User Pages verwdnet wurden
Widget buildButton(String text, Function funktion, double width, double padding,
    double borderRadius, BuildContext context) {
  return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0.5),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(padding)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff22C95C)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)))),
          onPressed: () {
            funktion();
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )));
}

/// Bildet die Text die in der User Pages verwendet wurde
Widget buildUser(BuildContext context, TextEditingController userController) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        TextFormField(
          controller: userController,
          validator: (value) {
            return Validator.validateUser(value ?? "");
          },
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.account_box_outlined,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              hintText: 'Benutzername',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        )
      ]);
}

/// Bildet die Image die in der User Pages verwendet wurden
Widget buildImage(String imageLink, double width, double height) {
  return Image.asset(
    imageLink,
    fit: BoxFit.contain,
    width: width,
    height: height,
  );
}

/// Bildet die Logo die in der User Pages verwendet wurden
Widget buildImageLogo(
    BuildContext context, String imageLink, double width, double height) {
  return Image.asset(
    imageLink,
    width: width,
    height: height,
    color: Theme.of(context).colorScheme.onBackground,
  );
}

/// Bildet weitere text die in der User Pages verwendet wurden
Widget buildText(BuildContext context, String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: FontWeight.bold),
  );
}

/// Bildet die PupUp fenster die nach der Registeration erschient
popupRegister(BuildContext context, String userName, String passwort) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Registration erfolgreich",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Sie werden Automatisch angemeldet",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Ok",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () async {
              Response res = await client.login(
                userName,
                passwort,
              );
              if (res.statusCode == 200) {
                final body = jsonDecode(res.body);
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString("login", body['token']);
                await prefs.setString("username", userName);
                routeToPage(context, const UserSetting());
              }
            },
          ),
        ],
      );
    },
  );
}

/// Methode bildet Massage die bsp. bei falsche Passwort erschient
void massage(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  ));
}

///Methode ist für das weiterleiten zu anderen Pages
void routeToPage(BuildContext context, var page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
