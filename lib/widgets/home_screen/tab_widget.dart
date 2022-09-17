import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatefulWidget {
  final Function changeTime;
  final double? width;
  TabWidget(this.changeTime, {this.width});
  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        // ignore: sort_child_properties_last
        children: [
          Positioned.fill(
            bottom: 1.5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(10, 0, 0, 0),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: widget.width! * 0.79,
                height: 9,
              ),
            ),
          ),
          DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: SizedBox(
              height: 56,
              child: TabBar(
                onTap: (index) => widget.changeTime(index),
                tabs: const [
                  Text('Short break'),
                  Text('Pomodoro'),
                  Text('Long break'),
                ],
                labelColor: Theme.of(context).colorScheme.primary,
                labelStyle: GoogleFonts.poppins(fontSize: 17),
                unselectedLabelColor: Colors.black38,
                unselectedLabelStyle: GoogleFonts.poppins(fontSize: 15),
                indicator: ContainerTabIndicator(
                  widthFraction: 0.5,
                  color: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.black,
                  height: 8,
                  radius: BorderRadius.circular(5),
                  padding: const EdgeInsets.only(top: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
