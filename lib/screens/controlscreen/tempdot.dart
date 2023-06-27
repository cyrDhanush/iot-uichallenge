import 'package:flutter/material.dart';
import 'package:iot_uichallenge/helpers/utils.dart';

class TempDot extends StatelessWidget {
  final double value;
  final Color dotColor;
  const TempDot({
    super.key,
    this.value = 0,
    this.dotColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: percentagetorad(value),
      child: Container(
        // color: Colors.pinkAccent,
        child: Row(
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: dotColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: dotColor.withAlpha(120),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
