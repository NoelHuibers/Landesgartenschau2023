import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/home/view/home_page.dart';

class user_setting extends StatefulWidget {
  const user_setting({Key? key}) : super(key: key);

  @override
  user_settingState createState() => user_settingState();
}

class user_settingState extends State<user_setting> {
  bool _showPassword = true;
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController newPassController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            profil_build(),
            const SizedBox(
              height: 10,
            ),
            mailtext_build(),
            const SizedBox(
              height: 10,
            ),
            buildOldPass(),
            const SizedBox(
              height: 10,
            ),
            buildPassword(),
            const SizedBox(
              height: 10,
            ),
            retrunPassword(),
            const SizedBox(
              height: 5,
            ),
            PassButton(),
            const SizedBox(
              height: 1,
            ),
            buildLogoutButton()
          ],
        ),
      ),
    );
  }

  Widget profil_build() {
    return Center(
        child: Stack(
      children: const <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundColor: Color(0xff5ac18e),
          //backgroundImage: ,
        )
      ],
    ));
  }

  Widget mailtext_build() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Email-Adresse',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 30.0,
                  width: 40.0,
                  child: Align(
                    alignment: Alignment(0.5, 0.6),
                    child: Icon(
                      Icons.email,
                      size: 25.0,
                      color: Color(0xff5ac18e),
                    ),
                  ),
                ),
                SizedBox(width: 24.0),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    "E-Mail: ",
                    style: TextStyle(fontSize: 18.0, color: Colors.black38),
                  ),
                ),
              ],
            ),
          )
        ]);
  }

  Widget area(String text, controller) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      height: 40,
      child: TextField(
        obscureText: _showPassword,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() => _showPassword = !_showPassword);
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 7),
          prefixIcon: const Icon(Icons.lock, color: Color(0xff5ac18e)),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.black38),
        ),
      ),
    );
  }

  Widget buildOldPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Old Password',
          style: TextStyle(
              color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        area("gib altes Passwort", oldPassController),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'New Password',
          style: TextStyle(
              color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        area("gib neues Passwort", newPassController),
      ],
    );
  }

  Widget retrunPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Return Password',
          style: TextStyle(
              color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        area("wiederhol neues Passwort", newPassController1),
      ],
    );
  }

  Widget PassButton() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5,
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: const Text(
            'Passwort ändern',
            style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildLogoutButton() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home_page()));
          },
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: const Text(
            'Abmelden',
            style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
