import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayState();
  }
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
          alignment: Alignment.center,
          child: Text('Play', style: TextStyle(fontSize: 18.0))),
    );
  }
}
