import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math' as math;


final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class EggTimerDial extends StatefulWidget {
  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(width: double.infinity, height: double.infinity,
            child: CustomPaint(painter: TickPainter(),)),
        //Inner Circle to rotate
        Padding(
          padding: EdgeInsets.all(130.0),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                    ),
                    boxShadow: [
                      new BoxShadow(
                        color: const Color(0x44000000),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.0, 1.0),
                      ),
                    ],
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://avatars3.githubusercontent.com/u/14101776?s=400&v=4',
                        width: 20.0,
                        height: 20.0,
//                       color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//class TickPainter extends CustomPaint {
//
//}

class TickPainter extends CustomPainter {

  final LONG_TICK = 0.5;

  final tickCount;
  final ticksInset;
  final tickPaint;
  final textPainter;
  final textStyle;

  TickPainter({
    this.tickCount = 35,
    this.ticksInset = 0.0,
  }) : tickPaint = new Paint(),
        textPainter = new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        textStyle = const TextStyle(
          color: Colors.black,
          fontSize: 10.0,

        ) {
    tickPaint.color = GRADIENT_TOP;
    tickPaint.strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height/ 2);

    canvas.save();

    final radius = size.width/2;
    for(var i = 0; i < (tickCount);i++) {
      canvas.drawLine(Offset(0.0, 0.0),
          Offset(0.0, -radius - LONG_TICK), tickPaint);

      canvas.rotate((2 * math.pi ) / tickCount);

      // Paint the text
      canvas.save();
      canvas.translate(0.0, -size.width/4);
      textPainter.text = new TextSpan(
        text: '$i',
        style: textStyle,
      );

      // Layout the text
      textPainter.layout();


      textPainter.paint(
        canvas,
        new Offset(
          -textPainter.width / 2 +8.0,
          -textPainter.height / 2,
        ),
      );

      canvas.restore();
    }




    canvas.restore();

    }




  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
