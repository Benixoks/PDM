import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pages/cart.page.dart';
import '../../pages/config.page.dart';
import '../../pages/home.page.dart';
import '../../pages/login.page.dart';
import '../../stores/user.store.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  HomePage homePage = const HomePage();
  ConfigPage configPage = const ConfigPage();
  CartPage cartPage = const CartPage();

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
        navigateToSelectedPage(cartPage);
        break;
      case 2:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Tem certeza que deseja sair?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    UserStore userStore = Provider.of<UserStore>(context, listen: false);
                    userStore.logOut(userStore.user.id);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Sair'),
                ),
              ],
            );
          },
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
          icon: Icon(Icons.shopping_cart),
          label: 'Carrinho',
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
