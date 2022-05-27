import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landesgartenschau2023/pages/user/api_client.dart';
import 'package:landesgartenschau2023/pages/user/user_setting.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => registerScreenState();
}

class registerScreenState extends State<registerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController return_passController = TextEditingController();
  final API_call _API_call = API_call();
  bool _showPassword = true;
  String password = '';
  String return_password = '';

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      dynamic res = await _API_call.register(
        mailController.text,
        passController.text,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['id'] != null && res['token'] != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const user_setting()));
      }

      if (res['token'] == null || res['id'] == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Die angegebene daten sind Falsch"),
          backgroundColor: Colors.red.shade300,
        ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: build_appBar(),
        body: Form(
          key: _formKey,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xff202020),
                          Color(0xff202020),
                          Color(0xff202020),
                          Color(0xff202020)
                        ])),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/lgs.png",
                            width: double.infinity,
                            height: 100,
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/images/konto.png",
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Account erstellen!',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          buildEmail(mailController),
                          const SizedBox(height: 10),
                          buildPassword(),
                          const SizedBox(height: 10),
                          buildReturnPass(),
                          const SizedBox(height: 10),
                          buildButton("Regestrieren", register),
                          const SizedBox(height: 10),
                          const Text(
                            '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  /*
    Die beiden BildPasswort Widget können in einen gebaut werden 
    und in der User_tools verschieben, ich wusste es nicht wie man das macht wegen 
    setState()
    */
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Color(0xff202020),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff202020),
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextFormField(
              obscureText: _showPassword,
              controller: passController,
              validator: (value) {
                return Validator.validatePassword(value!, return_password);
              },
              onChanged: (value) => password = value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(Icons.lock_open_outlined,
                    size: 23, color: Color(0xffFFFFFF)),
                hintText: "Passwort",
                hintStyle: const TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
            ))
      ],
    );
  }

  Widget buildReturnPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Color(0xff202020),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff202020),
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextFormField(
              obscureText: _showPassword,
              controller: return_passController,
              validator: (value) {
                return Validator.validatePassword(value!, password);
              },
              onChanged: (value) => return_password = value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(Icons.lock_open_outlined,
                    size: 23, color: Color(0xffFFFFFF)),
                hintText: "Passwort Wiederholen",
                hintStyle: const TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
            ))
      ],
    );
  }
}
