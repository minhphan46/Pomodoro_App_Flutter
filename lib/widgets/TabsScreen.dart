import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import '/screens/setting_screen.dart';
import '/widgets/my_app_bar.dart';

class TabsScreen extends StatefulWidget {
  final Function changeAppColor;
  TabsScreen(this.changeAppColor);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
//================Xu ly time =========================
  int _defaultTime = 25 * 60;
  int _shortBreakTime = 5 * 60;
  int _longBreakTime = 20 * 60;
  int _currentSceconds = 25 * 60;
  bool _backToPageHome = false;

  void setAllTime(int defaultTime, int short, int long) {
    setState(() {
      _defaultTime = defaultTime;
      _shortBreakTime = short;
      _longBreakTime = long;
      _currentSceconds = _defaultTime;
    });
  }

  void updateCurrentSecond(int seconds) {
    _currentSceconds = seconds;
  }

//== Xu ly chuyen trang ============================
  List<Map<String, dynamic>> _pages = [];
  int _seclectedPageIndex = 0;

  void _selectPage(int index) {
    if (index == _seclectedPageIndex) return;
    if (index == 1) _backToPageHome = false;
    if (index == 0) _backToPageHome = true;
    //if (_backToPageHome) print(_currentSceconds);
    //print('home page: $_backToPageHome');
    setState(() {
      _seclectedPageIndex = index;
      updateCurrentSecond;
    });
  }

  void _backToHome() {
    setState(() {
      _seclectedPageIndex = 0;
    });
  }

//====================================================

  @override
  Widget build(BuildContext context) {
    _pages = [
      {
        'page': HomeScreen(
          curentSeconds: _currentSceconds,
          defaultTime: _defaultTime,
          shortBreakTime: _shortBreakTime,
          longBreakTime: _longBreakTime,
          updateSeconds: updateCurrentSecond,
        ),
        'title': 'Categories',
      },
      {
        'page': SettingScreen(
          defaultTime: (_defaultTime / 60).toInt(),
          shortBreakTime: (_shortBreakTime / 60).toInt(),
          longBreakTime: (_longBreakTime / 60).toInt(),
          backToHome: _backToHome,
          saveTimeChange: setAllTime,
          changeAppColor: widget.changeAppColor,
        ),
        'title': 'Setting',
      },
    ];
    Widget iconDownLoad(String path) {
      return Container(
        margin: EdgeInsets.only(top: 2),
        height: 30,
        child: Image.asset(
          path,
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      //appBar: MyAppBar(resetTime: () {}) as PreferredSizeWidget,
      body: _pages[_seclectedPageIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _selectPage,
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 500),
        index: _seclectedPageIndex,
        height: 60,
        items: [
          iconDownLoad(
            (_seclectedPageIndex == 0)
                ? 'assets/icons/home.png'
                : 'assets/icons/home_outlined.png',
          ),
          iconDownLoad(
            (_seclectedPageIndex == 1)
                ? 'assets/icons/settings.png'
                : 'assets/icons/settings_outlined.png',
          ),
        ],
      ),
    );
  }
}
