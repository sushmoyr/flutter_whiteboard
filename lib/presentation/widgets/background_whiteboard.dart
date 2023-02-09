import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';

import '../../data/data.dart';

/// The custom paint that is responsible for drawing the background sketches.
/// Already existing data is drawn on the background statically. This widget
/// controls the background drawing operations.
class BackgroundWhiteboard extends ConsumerWidget {
  const BackgroundWhiteboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  /// The size of the canvas.
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

/// The [CustomPainter] subclass which is responsible for painting background
/// sketches.
class BackgroundWhiteboardPainter extends CustomPainter {
  /// The state class of the whiteboard controller.
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
    return true;
  }
}
