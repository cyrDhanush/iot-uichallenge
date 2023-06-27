import 'package:flutter/material.dart';
import 'package:iot_uichallenge/helpers/utils.dart';

class DrawArc extends CustomPainter {
  final double width = 30;
  double value;
  Color color;
  DrawArc({this.color = Colors.blue, this.value = 100});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: (size.width / 2) - width / 2,
        ),
        degtorad(180),
        // to ensure minimum value
        (value < 1) ? (degtorad(2)) : (percentagetorad(value)),
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
