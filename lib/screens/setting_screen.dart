import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/setting_screen/change_time_widget.dart';
import '../widgets/circle_button_widget.dart';
import '/widgets/my_app_bar.dart';

class SettingScreen extends StatefulWidget {
  //static const routeName = '/setting';
  int defaultTime;
  int shortBreakTime;
  int longBreakTime;
  final Function backToHome;
  final Function saveTimeChange;
  final Function changeAppColor;

  SettingScreen({
    required this.defaultTime,
    required this.shortBreakTime,
    required this.longBreakTime,
    required this.backToHome,
    required this.saveTimeChange,
    required this.changeAppColor,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void didChangeDependencies() {
    print(
        'media height2 : ${MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double heightOfScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    double widthOfScreen = MediaQuery.of(context).size.width;
    void setDefaultAllTime() {
      widget.defaultTime = 25;
      widget.shortBreakTime = 5;
      widget.longBreakTime = 20;
      print(widget.defaultTime);
      print(widget.shortBreakTime);
      print(widget.shortBreakTime);
      widget.saveTimeChange(
        widget.defaultTime * 60,
        widget.shortBreakTime * 60,
        widget.longBreakTime * 60,
      );
    }

    void getDefaultTime(int newTime) {
      widget.defaultTime = newTime;
    }

    void getShortBreakTime(int newTime) {
      widget.shortBreakTime = newTime;
    }

    void getLongBreakTime(int newTime) {
      widget.longBreakTime = newTime;
    }

    Widget builtSettingText() {
      return Container(
        padding:
            const EdgeInsets.only(top: 31, left: 47, right: 47, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Settings',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 26,
                ),
                onPressed: () {
                  widget.backToHome();
                },
              ),
            )
          ],
        ),
      );
    }

    Widget buildTimeText() {
      return Container(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          'TIME (MINUTES)',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      );
    }

    Widget buildSettingTime(String text, int time, Function getTime) {
      return Container(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            ChangeTime(time: time, getTime: getTime),
          ],
        ),
      );
    }

    Widget buildColorChoice(Color color, Function changeAppColor) {
      return GestureDetector(
        onTap: () {
          changeAppColor(color);
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              // inner shadow
              BoxShadow(
                color: Colors.white54,
                offset: Offset(-5, -5),
                blurRadius: 10,
                spreadRadius: 1,
                inset: true,
              ),
              BoxShadow(
                color: Colors.black54,
                offset: Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 1,
                inset: true,
              ),
            ],
          ),
        ),
      );
    }

    Widget buildFont() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'COLOR',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildColorChoice(Color(0xff0096C7), widget.changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xff2d6a4f), widget.changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xff8c2f39), widget.changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xffd68c45), widget.changeAppColor),
            ],
          ),
        ],
      );
    }

    Widget builtSetting(double height) {
      return Container(
        height: height, //396,
        width: height * 0.82, //325,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(5, 5),
              blurRadius: 50,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            builtSettingText(),
            const Divider(
              color: Colors.white38,
              thickness: 1,
              height: 0,
              indent: 1,
              endIndent: 1,
            ),
            buildTimeText(),
            buildSettingTime('pomodoro', widget.defaultTime, getDefaultTime),
            buildSettingTime(
                'short break', widget.shortBreakTime, getShortBreakTime),
            buildSettingTime(
                'long break', widget.longBreakTime, getLongBreakTime),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white38,
              thickness: 1,
              height: 0,
              indent: 1,
              endIndent: 1,
            ),
            buildFont(),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyAppBar(
          resetTime: setDefaultAllTime,
          height: heightOfScreen * 0.07,
          width: widthOfScreen,
        ),
        SizedBox(
          height: (heightOfScreen / widthOfScreen >= 1.6)
              ? (heightOfScreen * 0.08)
              : (heightOfScreen * 0.017),
        ),
        builtSetting((heightOfScreen <= 704) ? 373.12 : heightOfScreen * 0.53),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: heightOfScreen * 0.04,
                top: 5,
              ),
              child: CircleButtonWidget(
                height: (heightOfScreen >= 672) ? 100 : heightOfScreen * 0.1488,
                icon: Icons.done_rounded,
                onClicked: () {
                  widget.saveTimeChange(
                    widget.defaultTime * 60,
                    widget.shortBreakTime * 60,
                    widget.longBreakTime * 60,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
