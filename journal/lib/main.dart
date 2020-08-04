import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/newEntry.dart';
import 'screens/settings.dart';

void main() {
  runApp(JournalApp());
}

class JournalApp extends StatelessWidget {
  static final routes = {
    Home.routeName: (context) => Home(),
    NewEntry.routeName: (context) => NewEntry(),
    Settings.routeName: (context) => Settings(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
