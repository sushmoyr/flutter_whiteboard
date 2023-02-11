import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';

/// The [CustomPainter] subclass which is responsible for painting background
/// sketches.
class BackgroundWhiteboardPainter extends CustomPainter {
  /// The state class of the whiteboard controller.
  final Board board;
  final SketchFactory sketchFactory;

  const BackgroundWhiteboardPainter({
    required this.board,
    required this.sketchFactory,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    // print("Background size: $size");
    Paint backgroundPaint = Paint()..color = Colors.white;
    canvas.drawPaint(backgroundPaint);
    final sketches = board.sketches;

    final factory = SketchFactory.withDefaults(sketchFactory);

    for (Sketch sketch in sketches) {
      factory.find(sketch.name)?.paint(canvas, sketch);
    }
  }

  @override
  bool shouldRepaint(covariant BackgroundWhiteboardPainter oldDelegate) {
    return true;
  }
}
