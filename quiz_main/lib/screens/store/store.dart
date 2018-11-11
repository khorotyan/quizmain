import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
          alignment: Alignment.center,
          child: Text('Store', style: TextStyle(fontSize: 18.0))),
    );
  }
}
