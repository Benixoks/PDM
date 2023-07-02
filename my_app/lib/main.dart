import 'package:flutter/material.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/pages/main.page.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
