import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AchievementsState();
  }
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
          alignment: Alignment.center,
          child: Text('Achievements', style: TextStyle(fontSize: 18.0))),
    );
  }
}
