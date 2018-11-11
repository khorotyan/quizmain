import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaderboardState();
  }
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          alignment: Alignment.center,
          child: Text('Leaderboard', style: TextStyle(fontSize: 18.0))),
    );
  }
}
