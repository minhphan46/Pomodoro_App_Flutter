import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/setting_screen/change_time_widget.dart';
import '../widgets/circle_button_widget.dart';
import '/widgets/my_app_bar.dart';

class SettingScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    void setDefaultAllTime() {
      defaultTime = 25;
      shortBreakTime = 5;
      longBreakTime = 20;
      print(defaultTime);
      print(shortBreakTime);
      print(shortBreakTime);
      saveTimeChange(
        defaultTime * 60,
        shortBreakTime * 60,
        longBreakTime * 60,
      );
    }

    void getDefaultTime(int newTime) {
      defaultTime = newTime;
    }

    void getShortBreakTime(int newTime) {
      shortBreakTime = newTime;
    }

    void getLongBreakTime(int newTime) {
      longBreakTime = newTime;
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
                  backToHome();
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
              buildColorChoice(Color(0xff0096C7), changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xff2d6a4f), changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xff8c2f39), changeAppColor),
              const SizedBox(width: 12),
              buildColorChoice(Color(0xffd68c45), changeAppColor),
            ],
          ),
        ],
      );
    }

    Widget builtSetting() {
      return Container(
        height: 396,
        width: 325,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            // bottom right shadow is darker
            BoxShadow(
              color: Colors.black26,
              offset: Offset(5, 5),
              blurRadius: 50,
              spreadRadius: 1,
            ),
            // top left shadow is lighter
            /* BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ), */
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
            buildSettingTime('pomodoro', defaultTime, getDefaultTime),
            buildSettingTime('short break', shortBreakTime, getShortBreakTime),
            buildSettingTime('long break', longBreakTime, getLongBreakTime),
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

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyAppBar(resetTime: setDefaultAllTime),
            const SizedBox(height: 25),
            builtSetting(),
          ],
        ),
        Positioned(
          bottom: 30,
          left: 155,
          child: CircleButtonWidget(
            icon: Icons.done_rounded,
            onClicked: () {
              saveTimeChange(
                defaultTime * 60,
                shortBreakTime * 60,
                longBreakTime * 60,
              );
            },
          ),
        ),
      ],
    );
  }
}
