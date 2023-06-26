import 'package:flutter/material.dart';
import 'package:my_app/pages/home.page.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/pages/register.page.dart';
import 'package:my_app/pages/config_page.dart';
import 'package:my_app/pages/main.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
