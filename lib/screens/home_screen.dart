import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/home_screen/clock_widget.dart';
import '../widgets/home_screen/tab_widget.dart';
import '/widgets/my_app_bar.dart';
import '../widgets/circle_button_widget.dart';

class HomeScreen extends StatefulWidget {
  final int curentSeconds;
  final int defaultTime;
  final int shortBreakTime;
  final int longBreakTime;
  final Function updateSeconds;
  HomeScreen({
    required this.curentSeconds,
    required this.defaultTime,
    required this.shortBreakTime,
    required this.longBreakTime,
    required this.updateSeconds,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _maxSeconds = 0;
  int seconds = 0;
  Timer? timer;
  var speed = Duration(milliseconds: 100);

  @override
  void didChangeDependencies() {
    _maxSeconds = widget.defaultTime;
    seconds = widget.curentSeconds;
    super.didChangeDependencies();
  }

  void resetTimer() => setState(() => (seconds = _maxSeconds));

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(
      speed,
      (_) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
          widget.updateSeconds(seconds);
        } else {
          stopTimer(reset: false);
        }
      },
    );
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() => timer?.cancel());
  }

  void setMaxTime(int index) {
    if (index == 0) {
      _maxSeconds = widget.shortBreakTime;
      stopTimer();
    } else if (index == 1) {
      _maxSeconds = widget.defaultTime;
      stopTimer();
    } else if (index == 2) {
      _maxSeconds = widget.longBreakTime;
      stopTimer();
    }
  }

  Widget buildButton(double height) {
    final isRunning = (timer == null ? false : timer!.isActive);
    final isCompleted = (seconds == _maxSeconds || seconds == 0);
    return isRunning || !isCompleted
        ? CircleButtonWidget(
            height: 100,
            icon: isRunning ? Icons.pause : Icons.play_arrow_rounded,
            onClicked: () {
              if (isRunning) {
                stopTimer(reset: false);
              } else {
                startTimer(reset: false);
              }
              ;
            },
          )
        : CircleButtonWidget(
            height: 100,
            icon: Icons.play_arrow_rounded,
            onClicked: startTimer,
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double heightOfScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyAppBar(
            resetTime: stopTimer,
            height: heightOfScreen * 0.07,
            width: widthOfScreen,
          ),
          SizedBox(
              height: (heightOfScreen / widthOfScreen >= 1.6)
                  ? (heightOfScreen * 0.08)
                  : (heightOfScreen * 0.04)),
          ClockWidget(
            seconds: seconds,
            maxSeconds: _maxSeconds,
            height: (heightOfScreen <= 692) ? 221.44 : (heightOfScreen * 0.32),
          ),
          SizedBox(height: (heightOfScreen * 0.04)),
          // thanh chon default,  short, long
          TabWidget(setMaxTime, width: widthOfScreen),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: heightOfScreen * 0.04,
                  top: 5,
                ),
                child: buildButton(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
