import 'package:easyentry/listpage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'scan.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Listpage();
  }
}
