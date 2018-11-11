import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home/index.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new Main());
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Quiz',
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            accentColor: Colors.blueAccent,
            buttonColor: Colors.blueAccent),
        routes: {'/': (BuildContext context) => Home()});
  }
}
