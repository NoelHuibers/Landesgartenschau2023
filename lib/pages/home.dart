import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/login/user_setting.dart';
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'package:landesgartenschau2023/pages/map.dart';
import 'package:landesgartenschau2023/pages/settings.dart';
import 'package:landesgartenschau2023/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:landesgartenschau2023/pages/map/widgets/sliding_window.dart';

/*
Die Datei ist für das Bilden
der HomePage der App
*/

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceTint,
              leading: IconButton(
                icon: const Icon(Icons.account_circle_sharp),
                color: Theme.of(context).colorScheme.onBackground,
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (prefs.getString("login") != null) {
                    routeToPage(context, const UserSetting());
                  } else
                    routeToPage(context, const LoginScreen());
                },
              ),
              centerTitle: true,
              title: Image.asset("assets/images/logo6.png"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  color: Theme.of(context).colorScheme.onBackground,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                )
              ],
              actionsIconTheme: const IconThemeData(size: 32),
            ),
            body: SlidingUpPanel(
              controller: panelController,
              minHeight: 25,
              maxHeight: 600,
              onPanelSlide: (position) => FocusScope.of(context).unfocus(),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18)),
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: const Map(),
              panel: SlidePage(
                panelController: panelController,
              ),
            )));
  }
}
