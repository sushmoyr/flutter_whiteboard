import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../../data/data.dart';
import '../mappers/point_offset_converter.dart';

/// The [SketchPainter] class is an abstract class that represents a sketch
/// painter. It defines the basic properties and methods that a sketch painter
/// should have.
///
/// ## Usage
///
/// The class has a @mustCallSuper annotation on its constructor to indicate that
/// the derived classes should call the super constructor in their constructors.
// The createPaint method creates a paint object using the attributes of the
// given sketch. The paint method uses the createPaint method to get the paint
// and then draws the sketch on the canvas. The build method creates a new sketch
// by copying the given active sketch and adding the given point to the list of
// points of the sketch.
abstract class SketchPainter {
  /// The name of the sketch for which the painter is defined.
  final String name;

  @mustCallSuper
  const SketchPainter({required this.name});

  /// Creates a [Paint] object to be used for painting the sketch.
  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint;
  }

  /// Paints the sketch on the given Canvas.
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

  /// Builds a new sketch from the given active sketch and point.
  Sketch build(Sketch activeSketch, Point point) {
    return activeSketch.copyWith(
      points: [...activeSketch.points, point],
    );
  }
}
