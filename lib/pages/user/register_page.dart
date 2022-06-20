import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landesgartenschau2023/pages/user/api_client.dart';
import 'package:landesgartenschau2023/pages/user/user_setting.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';
import 'package:landesgartenschau2023/pages/user/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController returnPassController = TextEditingController();
  final ApiCall _apiCall = ApiCall();
  bool _showPassword = true;
  String password = '';
  String returnPassword = '';

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      dynamic res = await _apiCall.register(
        mailController.text,
        passController.text,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['id'] != null && res['token'] != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserSetting()));
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
        appBar: buildAppBar(context),
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
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildImage(
                              "assets/images/lgs.png", double.infinity, 100),
                          const SizedBox(height: 10),
                          buildImageLogo(context,
                              "assets/images/kontoImage.png", 100, 100),
                          const SizedBox(height: 10),
                          buildText(context, 'Account erstellen!', 20),
                          const SizedBox(height: 15),
                          buildEmail(context, mailController),
                          const SizedBox(height: 10),
                          buildPassword("passwort", password, passController),
                          const SizedBox(height: 10),
                          buildPassword("Passwort wiederholen", returnPassword,
                              returnPassController),
                          const SizedBox(height: 10),
                          buildButton(
                              "Regestrieren", register, 250, 20, 15, context),
                          const SizedBox(height: 10),
                          buildText(
                              context,
                              '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                              10),
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
            height: 60,
            width: 380,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
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
                prefixIcon: Icon(Icons.lock_open_outlined,
                    size: 23, color: Theme.of(context).colorScheme.onPrimary),
                hintText: text,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }
}
