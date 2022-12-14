import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClockWidget extends StatelessWidget {
  final int seconds;
  final int maxSeconds;
  final double? height;
  ClockWidget({
    required this.seconds,
    required this.maxSeconds,
    this.height,
  });

  Widget buildTime() {
    int minutes = (seconds / 60).toInt();
    int Seconds = (seconds % 60);
    if (seconds == 0) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
        size: 112,
      );
    }
    return Text(
      ((Seconds < 10) || (minutes < 10))
          ? ((Seconds < 10) && (minutes < 10)
              ? '0${minutes}:0${Seconds}'
              : ((minutes < 10)
                  ? '0${minutes}:${Seconds}'
                  : '${minutes}:0${Seconds}'))
          : '${minutes}:${Seconds}',
      style: GoogleFonts.poppins(
        //fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: height! * 0.192,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
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
                // bottom right shadow is darker
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(5, 5),
                  blurRadius: 50,
                  spreadRadius: 1,
                ),
                // top left shadow is lighter
                BoxShadow(
                  color: Colors.white54,
                  offset: Offset(-5, -5),
                  blurRadius: 50,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: height! * 0.84,
                height: height! * 0.84,
                child: CircularPercentIndicator(
                  percent: seconds / maxSeconds,
                  radius: height! * 0.42,
                  lineWidth: height! * 0.03,
                  progressColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor:
                      (seconds == 0) ? Colors.white : Colors.transparent,
                  center: buildTime(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
