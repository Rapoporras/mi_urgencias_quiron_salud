import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Urgencias',
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.red[800],
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}
