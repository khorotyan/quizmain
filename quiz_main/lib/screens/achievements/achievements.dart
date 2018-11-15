import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AchievementsState();
  }
}

class _AchievementsState extends State<Achievements> {
  double _screenWidth;
  double _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
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
                    _buildAchievementItem(),
                    _buildAchievementItem(),
                    _buildAchievementItem(),
                    _buildAchievementItem(),
                    _buildAchievementItem(isComplete: true),
                    _buildAchievementItem(),
                    _buildAchievementItem(claimReward: true),
                  ])))),
    );
  }

  Widget _buildAchievementItem(
      {bool isComplete = false, bool claimReward = false}) {
    return Card(
        child: Container(
            height: _screenHeight * 0.18,
            child: Column(children: <Widget>[
              Container(
                  height: _screenHeight * 0.18 * 0.65, child: _buildItemTop()),
              Container(
                  color: Colors.grey[100],
                  height: _screenHeight * 0.18 * (1 - 0.65),
                  child: _buildItemBottom(isComplete, claimReward))
            ])));
  }

  Widget _buildItemTop() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[_buildItemStars(), _buildItemMainTexts()]);
  }

  Widget _buildItemStars() {
    final _starsPartWidth = _screenWidth * 0.45;

    return Container(
        alignment: Alignment.center,
        width: _starsPartWidth,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset('images/icons/complete_star.png',
              width: _starsPartWidth * 0.3, height: _starsPartWidth * 0.3),
          Container(
              width: 55.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.1), BlendMode.colorDodge),
                      image: AssetImage('images/icons/complete_star.png')))),
          Image.asset('images/icons/complete_star.png',
              width: _starsPartWidth * 0.3,
              height: _starsPartWidth * 0.3,
              color: Colors.grey[200]),
        ]));
  }

  Widget _buildItemMainTexts() {
    return Container(
        width: _screenWidth * 0.5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: _screenHeight * 0.01),
                  child: Text('Achievement title',
                      style: TextStyle(fontSize: 16.0))),
              Container(
                  margin: EdgeInsets.only(top: _screenHeight * 0.01),
                  child: Text(
                      'Some achievement description and it is longer than expected',
                      style: TextStyle(fontSize: 14.0)))
            ]));
  }

  // Bottom either shows the rewards and completion amount
  //  or achievement complete text
  Widget _buildItemBottom(bool isComplete, bool claimReward) {
    if (isComplete) {
      return _buildItemCompletePanel();
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildItemRewards(),
          _buildBottomRightPanel(claimReward)
        ]);
  }

  Widget _buildItemRewards() {
    return Container(
        width: _screenWidth * 0.45,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(child: Text('20 XP'), alignment: Alignment.center),
          SizedBox(width: 2.0),
          Icon(Icons.stars),
          SizedBox(width: 12.0),
          Container(child: Text('5 Gems')),
          SizedBox(width: 2.0),
          Icon(Icons.view_carousel)
        ]));
  }

  Widget _buildBottomRightPanel(bool claimReward) {
    if (claimReward) {
      return _buildClaimRewardButton();
    }

    return _buildItemProgressBar();
  }

  Widget _buildClaimRewardButton() {
    return Container(
        width: _screenWidth * 0.5,
        height: _screenHeight * 0.042,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: _screenWidth * 0.02),
        child: RaisedButton(
            child: Text('Claim Reward', style: TextStyle(color: Colors.white)),
            onPressed: () {}));
  }

  Widget _buildItemProgressBar() {
    return Container(
        width: _screenWidth * 0.5,
        height: _screenHeight * 0.03,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              left: _screenWidth * (0.5 - 0.44) / 2,
              child: Container(
                  height: _screenHeight * 0.028,
                  width: _screenWidth * 0.44,
                  color: Colors.grey[300])),
          Positioned(
              left: _screenWidth * (0.5 - 0.44) / 2,
              child: Container(
                  height: _screenHeight * 0.028,
                  width: _screenWidth * 0.44 * (9 / 10),
                  color: Colors.grey[500])),
          Container(
              child: Text('36 / 40', style: TextStyle(color: Colors.white)))
        ]));
  }

  Widget _buildItemCompletePanel() {
    return Container(
        alignment: Alignment.center,
        child: Text('Achievement Complete!',
            style: TextStyle(fontSize: 18.0, color: Colors.black)));
  }
}
