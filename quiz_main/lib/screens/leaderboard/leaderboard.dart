import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaderboardState();
  }
}

class _LeaderboardState extends State<Leaderboard> {
  final _today = 'Today';
  final _thisWeek = 'This Week';
  final _thisMonth = 'This Month';
  final _allTime = 'All Time';
  String _currentOrder;

  @override
  void initState() {
    _currentOrder = _getOrderText();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
            title: Text('Leaderboard'),
            actions: <Widget>[_buildDropDown()]),
        backgroundColor: Colors.blue,
        body: Container(
            margin: EdgeInsets.only(
              left: _screenWidth * 0.01,
              right: _screenWidth * 0.01,
            ),
            child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildScoreItem(1, 'Jack Ryan', 23530),
                        _buildScoreItem(2, 'Henry Ford', 21200),
                        _buildScoreItem(3, 'Harry Potter', 21050),
                        _buildScoreItem(4, 'Harry Potter', 21050),
                        _buildScoreItem(5, 'Harry Potter', 21050),
                        _buildScoreItem(6, 'Harry Potter', 21050),
                        _buildScoreItem(7, 'Harry Potter', 21050),
                        _buildScoreItem(8, 'Harry Potter', 21050),
                        _buildScoreItem(9, 'Harry Potter', 21050),
                        _buildScoreItem(10, 'Harry Potter', 21050),
                        _buildScoreItem(11, 'Harry Potter', 21050),
                        _buildScoreItem(12, 'Harry Potter', 21050),
                        _buildScoreItem(13, 'Harry Potter', 21050),
                        _buildScoreItem(14, 'Harry Potter', 21050),
                        _buildScoreItem(15, 'Harry Potter', 21050),
                        _buildScoreItem(16, 'Harry Potter', 21050),
                        _buildScoreItem(17, 'Harry Potter', 21050),
                        _buildScoreItem(18, 'Harry Potter', 21050),
                        _buildScoreItem(19, 'Harry Potter', 21050),
                        _buildScoreItem(20, 'Harry Potter', 21050),
                        _buildScoreItem(21, 'Harry Potter', 21050),
                        _buildScoreItem(22, 'Harry Potter', 21050),
                        _buildScoreItem(23, 'Harry Potter', 21050),
                        _buildScoreItem(24, 'Harry Potter', 21050),
                        _buildScoreItem(25, 'Harry Potter', 21050),
                        Container(height: 50.0, color: Colors.white),
                        _buildScoreItem(214, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(215, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(216, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(217, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(218, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(219, 'Harry Potter', 21050,
                            isTopScore: false, isCurrentUser: true),
                        _buildScoreItem(220, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(221, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(222, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(223, 'Harry Potter', 21050,
                            isTopScore: false),
                        _buildScoreItem(224, 'Harry Potter', 21050,
                            isTopScore: false)
                      ]),
                ))));
  }

  Widget _buildScoreItem(int index, String name, int points,
      {bool isTopScore = true, bool isCurrentUser = false}) {
    bool _coloringOption = index % 2 == 1;

    // Change the constant 214
    int _theIndex = 214;
    if (!isTopScore && _isFirstNontopScoreEven(_theIndex)) {
      _coloringOption = index % 2 == 0;
    }

    Color _color = (_coloringOption) ? Colors.grey[50] : Colors.white;

    if (isCurrentUser) {
      _color = Colors.blue[50];
    }

    return Container(
        color: _color,
        height: 60.0,
        child: Row(children: <Widget>[
          _getFirstScoreRowItem(index),
          Container(child: Text(name), margin: EdgeInsets.only(left: 20.0)),
          Spacer(),
          Container(
              child: Text('Pts: $points'),
              margin: EdgeInsets.only(left: 20.0, right: 20.0))
        ]));
  }

  Widget _getFirstScoreRowItem(int index) {
    if (index <= 3) {
      String _imageUrl;

      switch (index) {
        case 2:
          _imageUrl = 'images/icons/icon_rank_sr.png';
          break;
        case 3:
          _imageUrl = 'images/icons/icon_rank_bn.png';
          break;
        default:
          _imageUrl = 'images/icons/icon_rank_gd.png';
          break;
      }

      return Container(
          child: Image.asset(_imageUrl, width: 38.0, height: 38.0),
          margin: EdgeInsets.only(left: 10.0));
    }
    return Container(
        child: Text('$index.'), margin: EdgeInsets.only(left: 20.0));
  }

  bool _isFirstNontopScoreEven(int index) {
    return index % 2 == 0;
  }

  Widget _buildDropDown() {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      onChanged: _onOrderChange,
      style: TextStyle(color: Colors.black),
      hint: Text(_currentOrder, style: TextStyle(color: Colors.white)),
      items: <DropdownMenuItem<String>>[
        DropdownMenuItem(
            value: _getOrderText(order: SortOrder.today),
            child: Text('Today', style: TextStyle(color: Colors.black))),
        DropdownMenuItem(
            value: _getOrderText(order: SortOrder.thisWeek),
            child: Text('This Week', style: TextStyle(color: Colors.black))),
        DropdownMenuItem(
            value: _getOrderText(order: SortOrder.thisMonth),
            child: Text('This Month', style: TextStyle(color: Colors.black))),
        DropdownMenuItem(
            value: _getOrderText(order: SortOrder.allTime),
            child: Text('All Time', style: TextStyle(color: Colors.black))),
      ],
    ));
  }

  void _onOrderChange(String order) {
    setState(() {
      _currentOrder = order;
    });
  }

  String _getOrderText({SortOrder order}) {
    switch (order) {
      case SortOrder.today:
        return _today;
      case SortOrder.thisWeek:
        return _thisWeek;
      case SortOrder.thisMonth:
        return _thisMonth;
      case SortOrder.allTime:
        return _allTime;
      default:
        return _today;
    }
  }
}

enum SortOrder { today, thisWeek, thisMonth, allTime }
