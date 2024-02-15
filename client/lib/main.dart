import 'package:client/screens/boarding_screen.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromARGB(255, 38, 63, 87));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: darkTheme,
      home: const BoardingScreen(),
    );
  }
}
