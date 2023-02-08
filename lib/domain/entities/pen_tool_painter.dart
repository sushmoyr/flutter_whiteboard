import 'dart:ui';

import '../../data/data.dart';
import 'sketch_painter.dart';

class PenTool extends SketchPainter {
  const PenTool() : super(name: "pen");

  @override
  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }
}
