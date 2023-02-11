import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';

import '../../data/data.dart';
import '../controllers/background_whiteboard_painter.dart';

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
    // print("$runtimeType : ${state.board.sketches.length}");
    return CustomPaint(
      painter: BackgroundWhiteboardPainter(
        board: state.board,
        sketchFactory: state.sketchFactory,
      ),
      size: size,
    );
  }
}
