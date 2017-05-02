import 'package:flutter/material.dart';
import "dart:ui";

class BarChartPainter extends CustomPainter {

  BarChartPainter(this.barHeight);

  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    drawGraph(canvas, paint);
  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}

void drawGraph(Canvas canvas, Paint paint){

}
