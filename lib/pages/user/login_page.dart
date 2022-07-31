import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/user/api_client.dart';
import 'package:landesgartenschau2023/pages/user/register_page.dart';
import 'package:landesgartenschau2023/pages/user/user_setting.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final ApiCall _apiCall = ApiCall();
  bool _showPassword = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiCall.login(
        mailController.text,
        passController.text,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['token'] != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserSetting()));
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
        appBar: buildAppBar(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // buildImage("assets/images/lgs.png", double.infinity, 100),
                    SizedBox(height: 10.h),
                    buildImageLogo(
                        context, "assets/images/kontoImage.png", 100, 100),
                    SizedBox(height: 10.h),
                    buildText(context, 'Wilkommen zurück!', 20),
                    SizedBox(height: 15.h),
                    buildEmail(context, mailController),
                    SizedBox(height: 10.h),
                    buildPassword(),
                    SizedBox(height: 20.h),
                    buildButton("Anmelden", login, 250, 20, 15, context),
                    SizedBox(height: 150.h),
                    buildButton("Du hast noch kein Konto", registerNavigate,
                        150, 10, 10, context),
                    //SizedBox(height: 10.h),
                    buildText(
                        context,
                        '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                        10),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void registerNavigate() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
                color: Theme.of(context).colorScheme.primary, //Background
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: passController,
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
                hintText: "Passwort",
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }
}
