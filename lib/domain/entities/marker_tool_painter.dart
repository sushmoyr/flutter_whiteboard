import 'dart:ui';

import '../../data/models/sketch/sketch.dart';
import 'sketch_painter.dart';

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
