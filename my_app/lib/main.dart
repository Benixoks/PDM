import 'package:flutter/material.dart';
import 'package:my_app/pages/home.page.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/pages/register.page.dart';
import 'package:my_app/pages/config_page.dart';
import 'package:my_app/pages/main.page.dart';
import 'package:my_app/provider/user_provider.dart';

void main() async {
  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.black,
        ),
    );
  }
}
