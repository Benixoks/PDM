import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pages/config.page.dart';
import '../../pages/home.page.dart';
import '../../pages/login.page.dart';
import '../../stores/user.store.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  HomePage homePage = const HomePage();
  ConfigPage configPage = const ConfigPage();

  int _selectedIndex = 0;

  void navigateToSelectedPage(Widget selectedWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedWidget),
    );
  }

  void _onItemTapped(int index) async {
    switch (index) {
      case 0:
        navigateToSelectedPage(homePage);
        break;
      case 1:
        navigateToSelectedPage(configPage);
        break;
      case 2:
        UserStore userStore = Provider.of<UserStore>(context, listen: false);
        userStore.logOut(userStore.user.id);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Sair',
        ),
      ],
      selectedItemColor: Colors.greenAccent,
    );
  }
}
