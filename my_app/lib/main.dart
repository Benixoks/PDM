import 'package:flutter/material.dart';
import 'package:my_app/pages/main.page.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 244, 24, 8),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 244, 24, 8),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}