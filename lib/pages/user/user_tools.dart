import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';

import '../home.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(color: Theme.of(context).colorScheme.onPrimary),
    title: InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
          (Route<dynamic> route) => false,
        );
      },
      child: Image.asset("assets/images/logo6.png", width: 270, height: 40),
    ),
  );
}

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
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          )));
}

Widget buildEmail(BuildContext context, TextEditingController eMailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        height: 60,
        width: 380,
        child: TextFormField(
          controller: eMailController,
          validator: (value) {
            return Validator.validateEmail(value ?? "");
          },
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
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
        ),
      )
    ],
  );
}

Widget buildImage(String imageLink, double width, double height) {
  return Image.asset(
    imageLink,
    width: width,
    height: height,
  );
}

Widget buildImageLogo(
    BuildContext context, String imageLink, double width, double height) {
  return Image.asset(
    imageLink,
    width: width,
    height: height,
    color: Theme.of(context).colorScheme.onBackground,
  );
}

Widget buildTest(BuildContext context, String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: FontWeight.bold),
  );
}
