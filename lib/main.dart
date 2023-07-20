import 'package:assignment/pages/input_page/input_page.dart';
import 'package:assignment/pages/second_page/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/display': (context) => DisplayScreen(),
      },
    );
  }
}
