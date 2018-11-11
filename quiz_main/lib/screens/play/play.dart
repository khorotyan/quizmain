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
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/play_background.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.3), BlendMode.srcOver),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: ButtonTheme(
              minWidth: _screenWidth * 0.38,
              height: _screenWidth * 0.38 / 3.8,
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text('Play',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  onPressed: () {}))),
    );
  }
}
