import 'package:flutter/material.dart';
import 'package:my_app/pages/home.page.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/pages/register.page.dart';
import 'package:my_app/stores/item.store.dart';
import 'package:my_app/stores/user.store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => UserStore(),
          ),
          Provider(
            create: (context) => ItemStore(),
          ),
        ],
        child: MaterialApp(
          routes: {
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/register': (context) => const RegisterPage()
          },
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.red,
            scaffoldBackgroundColor: Colors.black,
            cardColor: Colors.black,
          ),
          theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(255, 244, 24, 8),
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
        ));
  }
}
