import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home.dart';
import 'screens/newEntry.dart';
import 'screens/settings.dart';
import 'screens/details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(JournalApp(preferences: await SharedPreferences.getInstance()));
}

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;

  JournalApp({Key key, @required this.preferences}) : super(key: key);

  static final routes = {
    Home.routeName: (context) => Home(),
    NewEntry.routeName: (context) => NewEntry(),
    Settings.routeName: (context) => Settings(),
    Details.routeName: (context) => Details(),
  };

  @override
  JournalAppState createState() => JournalAppState();
}

class JournalAppState extends State<JournalApp> {
  static const DARKMODE = 'darkMode';
  bool get darkModeOn => widget.preferences.getBool(DARKMODE) ?? false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: darkModeOn
          ? ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.deepOrange,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            )
          : ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
      routes: JournalApp.routes,
    );
  }

  void toggleDarkMode() {
    setState(() {
      widget.preferences.setBool(DARKMODE, !darkModeOn);
    });
  }
}
