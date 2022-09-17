import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback? resetTime;
  final double? height;
  final double? heightOfPaddingTop;
  final double? width;
  MyAppBar({this.resetTime, this.height, this.width, this.heightOfPaddingTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width! * 0.05,
          vertical: heightOfPaddingTop! + height! * 0.1),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'POMODORO',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          GestureDetector(
            onTap: resetTime,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              height: height! * 0.7,
              width: height! * 0.7,
              child: Container(
                margin: EdgeInsets.only(top: 2),
                //height: 10,
                child: Image.asset(
                  'assets/icons/reset.png',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
