import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/BusinessCard.dart';
import 'screens/Magic8Ball.dart';
import 'screens/Resume.dart';
import 'presentation/my_flutter_app_icons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  runApp(CallMe());
}

class CallMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.deepOrange)),
      ),
      home: MainTabController(),
    );
  }
}

class MainTabController extends StatelessWidget {
  static const tabs = [
    Tab(icon: Icon(MyFlutterApp.address_card)),
    Tab(icon: Icon(MyFlutterApp.doc_text_inv)),
    Tab(icon: Icon(MyFlutterApp.question_circle))
  ];

  final screens = [BusinessCard(), Resume(), Magic8Ball()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        initialIndex: 0,
        child: Scaffold(
          appBar:
              AppBar(title: Text('Call Me Maybe'), bottom: TabBar(tabs: tabs)),
          body: TabBarView(children: screens),
        ));
  }
}
