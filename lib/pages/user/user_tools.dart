import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';

PreferredSizeWidget buildAppBar() {
  return AppBar(
    actions: <Widget>[
      Image.asset("assets/images/logo6.png", width: 110, height: 40)
    ],
  );
}

Widget buildButton(String text, Function funktion) {
  return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5.0),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff22C95C)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        onPressed: () {
          funktion();
        },
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xff202020),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ));
}

Widget buildEmail(TextEditingController eMailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: const Color(0xff202020),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff202020), blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          controller: eMailController,
          validator: (value) {
            return Validator.validateEmail(value ?? "");
          },
          style: const TextStyle(color: Color(0xffFFFFFF)),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon:
                  Icon(Icons.account_box_outlined, color: Color(0xffFFFFFF)),
              hintText: 'Benutzername',
              hintStyle: TextStyle(color: Color(0xffFFFFFF))),
        ),
      )
    ],
  );
}
