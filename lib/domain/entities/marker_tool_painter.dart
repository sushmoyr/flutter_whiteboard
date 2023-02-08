import 'dart:ui';

import '../../data/models/sketch/sketch.dart';
import 'sketch_painter.dart';

/// The MarkerTool class extends the SketchPainter class and is used to paint a
/// marker on the canvas. The marker is created with a stroke width of 20, a
/// square stroke cap, a stroke style, and a normal blur mask filter with a radius of 4.
class MarkerTool extends SketchPainter {
  const MarkerTool() : super(name: 'marker');

  @override
  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    // ..imageFilter = ImageFilter.erode(radiusX: 2, radiusY: 4);
  }
}
