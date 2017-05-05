import 'package:flutter/material.dart';
import "dart:ui";
import "calculateRoots.dart";
import "main.dart";

Canvas myCanvas;
Paint myPaint;

class BarChartPainter extends CustomPainter {

  BarChartPainter(this.barHeight);

  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    final coordPaint = new Paint()
      ..color = new Color.fromARGB(200, 0, 163, 255)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    drawGraph(canvas, paint, coordPaint);

  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}

void drawGraph(Canvas canvas, Paint paint, Paint coordPaint){
  double xJumps = 0.1;
  double nextX, nextY = 0.0;
  double currentX, currentY = 0.0;
  int stretchFactor = 5;
  int maxDrawPoint = 80;

  List<List<double>> values = [];
  for (double x = -10.0; x <= 10.0; x += xJumps){
    values.add([x + 10, calculateYOfX(function, x)]);
  }

  canvas.drawLine(new Offset(0.0, 100.0), new Offset(100.0, 100.0), coordPaint);
  canvas.drawLine(new Offset(50.0, 00.0), new Offset(50.0, 180.0), coordPaint);

  for (int i = 0; i < values.length - 1; i++){
    nextX = values[i+1][0] * 5;
    nextY = values[i+1][1] * -1;
    currentX = values[i][0] * 5;
    currentY = values[i][1] * -1;
    if (nextY.abs() <= maxDrawPoint){
      canvas.drawLine(new Offset(currentX, currentY+100.0), new Offset(nextX, nextY+100.0), paint);
    }
  }
}
