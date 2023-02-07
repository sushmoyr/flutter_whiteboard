import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';

import '../../data/data.dart';

class BackgroundWhiteboard extends ConsumerWidget {
  const BackgroundWhiteboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(whiteboardControllerProvider);
    return CustomPaint(
      painter: BackgroundWhiteboardPainter(state),
      size: size,
    );
  }
}

class BackgroundWhiteboardPainter extends CustomPainter {
  final WhiteboardState state;
  BackgroundWhiteboardPainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    // print("Background size: $size");
    Paint backgroundPaint = Paint()..color = Colors.white;
    canvas.drawPaint(backgroundPaint);
    final sketches = state.board.sketches;

    final sketchFactory = SketchFactory.withDefaults(state.sketchFactory);

    for (Sketch sketch in sketches) {
      sketchFactory.find(sketch.name)?.paint(canvas, sketch);
    }
  }

  @override
  bool shouldRepaint(covariant BackgroundWhiteboardPainter oldDelegate) {
    return oldDelegate.state != state;
  }
}
