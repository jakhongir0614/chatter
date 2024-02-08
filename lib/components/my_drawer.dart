import 'package:chatter/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {


  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}
void logout(){
  final _auth = AuthService();
  _auth.signOut();
}
class _MyDrawerState extends State<MyDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.white38,
          name: 'Home',
          baseStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white70,
            fontSize: 18
          ),
          selectedStyle: TextStyle(fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 24),
        ),
         HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.white38,
          name: 'Settings',
          baseStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white70,
              fontSize: 18
          ),
          selectedStyle: const TextStyle(fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 24),
        ),
        const SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  HiddenDrawerMenu(actionsAppBar: [
       IconButton(
        onPressed:   logout,
        icon: Icon(Icons.logout),
      ),
    ],
      screens: _pages,
      backgroundColorMenu: Theme.of(context).colorScheme.primary,
      initPositionSelected: 0,
      slidePercent: 40,
    );
  }
}
