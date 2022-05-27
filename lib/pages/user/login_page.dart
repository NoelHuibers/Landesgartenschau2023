import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landesgartenschau2023/pages/user/api_client.dart';
import 'package:landesgartenschau2023/pages/user/user_setting.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final API_call _API_call = API_call();
  bool _showPassword = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _API_call.login(
        mailController.text,
        passController.text,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['token'] != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const user_setting()));
      }
      if (res['token'] == null) {
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
        appBar: AppBar(
          title: Text(
            'Login Page',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
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
                      // physics: AlwaysScrollableScrollPhysics(), //buna bakalim bir kaydirmak icin
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/lgs.png", width:double.infinity,height:100,),
                          const SizedBox(height: 10),
                          Image.asset("assets/images/konto.png", width: 100,height: 100,),
                          const SizedBox(height: 10),
                          const Text(
                            'Wilkommen zurück!',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          buildEmail(),
                          const SizedBox(height: 10),
                          buildPassword(),
                          const SizedBox(height: 20),
                          buildLoginButton(),
                          const SizedBox(height: 20),
                          const Text(
                            'Du hast noch kein Konto?',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          //const TextSpan(
                          //  text: 'asdaf',
                          //  style: TextStyle(color: Colors.black),
                          //),
                          const SizedBox(height: 10),
                          const Text(
                            '© Landesgartenschau Höxter 2023 gGmbH \n                   Alle Rechte vorbehalten.',
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

  Widget buildLoginButton() {
    return Container(
        width: 250,
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
            login();
          },
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xff22C95C),
          child: const Text(
            'Anmelden',
            style: TextStyle(
                color: Color(0xff202020),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildEmail() {
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
                    color: Color(0xff202020), blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: mailController,
            validator: (value) {
              return Validator.validateEmail(value ?? "");
            },
            //keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Color(0xffFFFFFF)),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.account_box_outlined, color: Color(0xffFFFFFF)),
                hintText: 'Benutzername',
                hintStyle: TextStyle(color: Color(0xffFFFFFF))),
          ),
        )
      ],
    );
  }

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
                    color: Color(0xff202020), blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: _showPassword,
            controller: passController,
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
              prefixIcon: const Icon(Icons.lock_open_outlined, size: 23, color: Color(0xffFFFFFF)),
              hintText: "Passwort",
              hintStyle: const TextStyle(color: Color(0xffFFFFFF),
            ),
          ),
        )
        )],
    );
  }
}
