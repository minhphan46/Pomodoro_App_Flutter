import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback? resetTime;

  MyAppBar({this.resetTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 66),
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
              height: 46,
              width: 46,
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
    /* return AppBar(
      title: Text(
        'POMODORO',
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () => resetTime,
          icon: Icon(
            Icons.rotate_right_rounded,
            // size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
        )
      ],
    ); */
  }
}
