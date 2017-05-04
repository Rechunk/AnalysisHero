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
    drawGraph(canvas, paint);

  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}

void drawGraph(Canvas canvas, Paint paint){
  double xJumps = 1.0;
  double nextX, nextY = 0.0;
  double currentX, currentY = 0.0;
  double addedX = 0.0;

  List<List<double>> values = [];
  for (double x = -10.0; x <= 10.0; x += xJumps){
    values.add([x + 10, calculateYOfX(function, x)]);
  }

  for (int i = 0; i < values.length - 1; i++){
    nextX = values[i+1][0] * 5;
    nextY = values[i+1][1] * -1;
    currentX = values[i][0] * 5;
    currentY = values[i][1] * -1;
    print("$currentX, ${currentY+100} to $nextX, ${nextY + 100}");
    canvas.drawLine(new Offset(currentX, currentY+120.0), new Offset(nextX, nextY+120.0), paint);
  }
}
