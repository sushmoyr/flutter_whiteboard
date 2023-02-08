import 'dart:ui';

import 'package:flutter_whiteboard/domain/entities/sketch_painter.dart';

import '../../data/models/sketch/sketch.dart';

enum _EraserSize {
  m(8),
  l(16),
  xl(24);

  final double value;
  const _EraserSize(this.value);
}

class EraserTool extends SketchPainter {
  const EraserTool() : super(name: "eraser");

  @override
  Paint createPaint(Sketch sketch) {
    return sketch.attributes.paint
      ..color = const Color(0xFFFFFFFF)
      ..strokeCap = StrokeCap.round
      // ..strokeWidth =
      //     _getEraserStrokeWidth(sketch.attributes.strokeWidth)?.value ??
      //         sketch.attributes.strokeWidth
      ..strokeWidth = 60
      ..style = PaintingStyle.stroke;
    // ..blendMode = BlendMode.clear;
  }

  _EraserSize? _getEraserStrokeWidth(double original) {
    if (original <= _EraserSize.m.value) {
      return _EraserSize.m;
    }

    if (original <= _EraserSize.l.value) {
      return _EraserSize.l;
    }

    if (original <= _EraserSize.xl.value) {
      return _EraserSize.xl;
    }

    return null;
  }
}
