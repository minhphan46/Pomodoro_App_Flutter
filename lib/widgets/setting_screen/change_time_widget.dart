import 'package:flutter/material.dart';

class ChangeTime extends StatelessWidget {
  final int time;
  final Function getTime;
  final VoidCallback increaseTime;
  final VoidCallback decreaseTime;
  ChangeTime(
    this.increaseTime,
    this.decreaseTime, {
    required this.time,
    required this.getTime,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 124,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (time < 10) ? '0${time}' : '${time}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.only(top: 4),
                constraints: BoxConstraints(maxHeight: 20),
                onPressed: increaseTime,
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  size: 20,
                  color: Colors.white70,
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(bottom: 0),
                constraints: BoxConstraints(maxHeight: 20),
                onPressed: decreaseTime,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
