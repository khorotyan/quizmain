import 'package:flutter/material.dart';

import '../play/index.dart';
import '../store/index.dart';
import '../leaderboard/index.dart';
import '../achievements/index.dart';
import '../profile/index.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _accentColor = Theme.of(context).accentColor;

    return Scaffold(
        body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              Play(),
              Store(),
              Leaderboard(),
              Achievements(),
              Profile()
            ]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabClick,
          currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_filled, color: _accentColor),
                title: Text('Play', style: TextStyle(color: _accentColor))),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket, color: _accentColor),
                title: Text('Store', style: TextStyle(color: _accentColor))),
            BottomNavigationBarItem(
                icon: Icon(Icons.compare, color: _accentColor),
                title:
                    Text('Leaderboard', style: TextStyle(color: _accentColor))),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_all, color: _accentColor),
                title: Text('Achievements',
                    style: TextStyle(color: _accentColor))),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: _accentColor),
                title: Text('Profile', style: TextStyle(color: _accentColor)))
          ],
        ));
  }

  void _onTabClick(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
}
