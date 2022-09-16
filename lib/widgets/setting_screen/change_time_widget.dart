import 'package:flutter/material.dart';

class ChangeTime extends StatefulWidget {
  final int time;
  final Function getTime;
  ChangeTime({required this.time, required this.getTime});
  @override
  State<ChangeTime> createState() => _ChangeTimeState();
}

class _ChangeTimeState extends State<ChangeTime> {
  int _time = 0;

  @override
  void initState() {
    _time = widget.time;
    super.initState();
  }

  void increaseTime() {
    setState(() {
      (_time >= 60) ? _time = 0 : _time++;
    });
    widget.getTime(_time);
  }

  void decreaseTime() {
    setState(() {
      (_time == 0) ? _time = 0 : _time--;
    });
    widget.getTime(_time);
  }

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
            (_time < 10) ? '0${_time}' : '${_time}',
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
