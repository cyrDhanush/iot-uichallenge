import 'package:flutter/material.dart';
import 'package:iot_uichallenge/helpers/utils.dart';

class TrialPage extends StatefulWidget {
  const TrialPage({super.key});

  @override
  State<TrialPage> createState() => _TrialPageState();
}

class _TrialPageState extends State<TrialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Container(
            height: 250,
            width: 250,
            // color: Colors.blue.withAlpha(50),
            child: CustomPaint(
              painter: drawarc(color: Colors.black.withAlpha(30), isBG: true),
              foregroundPainter: drawarc(
                color: Colors.blue,
              ),
              // child: CustomPaint(
              //   painter: drawarc(
              //     color: Colors.blue,
              //   ),
              // ),
              willChange: true,
            ),
          ),
        ],
      ),
    );
  }
}

class drawarc extends CustomPainter {
  final double width = 30;
  bool isBG;
  Color color;
  drawarc({required this.color, this.isBG = false}) {
    this.color = color;
    this.isBG = isBG;
  }
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = this.color
      ..strokeWidth = width
      ..shader = LinearGradient(colors: [Colors.blue, Colors.yellow])
          .createShader(
              Rect.fromPoints(Offset(0, size.height), Offset(size.width, 0)))
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.width / 2) - width / 2,
      ),
      degtorad(180),
      degtorad((isBG == true) ? (360) : (180)),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// class drararc extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     Paint paint = Paint()
//       ..strokeWidth = 35
//       ..style = PaintingStyle.stroke
//       ..color = Colors.pink;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         3.141,
//         degtorad(180),
//         false,
//         paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
