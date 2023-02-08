import 'dart:ui';

import '../../data/data.dart';
import 'sketch_painter.dart';

/// The PenTool class extends the SketchPainter class and is used to paint a pen
/// on the canvas. The pen is created with a stroke width of 2 and a round stroke cap.
class PenTool extends SketchPainter {
  const PenTool() : super(name: "pen");

  @override
  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }
}
