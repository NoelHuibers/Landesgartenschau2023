import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';
import '/services/client.dart' as client;
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'package:landesgartenschau2023/pages/login/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden der Registration-Page
wo der User sich registrieren kann
*/

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController returnPassController = TextEditingController();
  bool _showPassword = true;
  String password = '';
  String returnPassword = '';

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.processingdata),
        backgroundColor: Colors.green.shade300,
      ));

      Response res = await client.register(
        userController.text,
        passController.text,
      );
      // ignore_for_file: use_build_context_synchronously
      if (res.statusCode == 201) {
        popupRegister(context, userController.text, passController.text);
      }
      if (res.statusCode == 409) {
        massage(context, AppLocalizations.of(context)!.useralreadyexist);
      }
      if (res.statusCode == 413) {
        massage(context, AppLocalizations.of(context)!.passwordtolong);
      }
      if (res.statusCode == 422) {
        massage(context, AppLocalizations.of(context)!.passwordtoshort);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
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
                                buildText(
                                    context,
                                    AppLocalizations.of(context)!.createaccount,
                                    20),
                                SizedBox(height: 30.h),
                                DefaultCard(
                                  child: buildUser(context, userController),
                                ),
                                SizedBox(height: 15.h),
                                DefaultCard(
                                  child: buildPassword(
                                      AppLocalizations.of(context)!.password,
                                      password,
                                      passController),
                                ),
                                SizedBox(height: 15.h),
                                DefaultCard(
                                  child: buildPassword(
                                      AppLocalizations.of(context)!
                                          .repeatpassword,
                                      returnPassword,
                                      returnPassController),
                                ),
                                SizedBox(height: 25.h),
                                buildButton(
                                    AppLocalizations.of(context)!.createaccount,
                                    register,
                                    250,
                                    20,
                                    15,
                                    context),
                                SizedBox(height: 110.h),
                                buildText(
                                    context,
                                    '© Landesgartenschau Höxter 2023 GmbH \n                   ${AppLocalizations.of(context)!.allrightsreserved}',
                                    10),
                              ],
                            ),
                          ),
                        )),
                      ))
                ])))));
  }

  ///Bildet den  Passwort-Eingabebereich
  ///in der Register Page
  Widget buildPassword(
      String text, String pass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              obscureText: _showPassword,
              controller: controller,
              validator: (value) {
                return Validator.validatePassword(
                    value!,
                    pass,
                    '    ${AppLocalizations.of(context)!.minimumLengthPassword}',
                    context);
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
                    _showPassword
                        ? Icons.lock_open_outlined
                        : Icons.lock_outline,
                    size: 23,
                    color: Theme.of(context).colorScheme.onPrimary),
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
