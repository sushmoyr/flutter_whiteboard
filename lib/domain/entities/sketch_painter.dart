import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../../data/data.dart';
import '../mappers/point_offset_converter.dart';

abstract class SketchPainter {
  final String name;

  @mustCallSuper
  const SketchPainter({required this.name});

  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint;
  }

  void paint(Canvas canvas, Sketch sketch) {
    Paint paint = createPaint(sketch);

    List<Offset> points = sketch.points.map<Offset>((e) => e.asOffset).toList();
    if (points.isEmpty) return;

    if (points.length < 2) {
      canvas.drawCircle(points.first, 1, paint);
    }

    Path path = Path();
    path.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length - 1; i++) {
      Offset p0 = points[i];
      Offset p1 = points[i + 1];
      path.quadraticBezierTo(
          p0.dx, p0.dy, (p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
    }
    canvas.drawPath(path, paint);
  }

  Sketch build(Sketch activeSketch, Point point) {
    return activeSketch.copyWith(
      points: [...activeSketch.points, point],
    );
  }
}
