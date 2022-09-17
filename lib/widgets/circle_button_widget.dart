import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData icon;
  final double? height;
  const CircleButtonWidget({
    required this.icon,
    required this.onClicked,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), //radius cho widget
        color: Theme.of(context).colorScheme.primary,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onClicked,
          child: Container(
            child: Icon(
              icon,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
