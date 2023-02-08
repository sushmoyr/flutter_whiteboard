import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

/// The widget that controls the foreground drawing canvas and drawing operations.
class ForegroundArtboard extends ConsumerWidget {
  const ForegroundArtboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  /// The size of the canvas.
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(whiteboardControllerProvider);
    final controller = ref.read(whiteboardControllerProvider.notifier);
    // print("Foreground artboard");
    return Listener(
      onPointerDown: (event) => controller.onPointerDown,
      onPointerUp: (event) => controller.onPointerUp,
      onPointerMove: (event) => controller.onPointerMove,
      child: CustomPaint(
        painter: ForegroundPainter(state),
        size: size,
      ),
    );
  }
}

/// The [ForegroundPainter] class extends the [CustomPainter] class in Flutter. It
/// is used to paint the foreground of a whiteboard.
///
/// ## Usage
///
/// The [ForegroundPainter] is usually used in combination with a [CustomPaint]
/// widget in Flutter to paint the foreground of a whiteboard. When creating an
/// instance of the [ForegroundPainter], the [WhiteboardState] object must be
/// passed as an argument.
class ForegroundPainter extends CustomPainter {
  /// `state`: The [WhiteboardState] object that holds the active sketch to be painted.
  final WhiteboardState state;

  ForegroundPainter(this.state);

  /// This method is called when it's time to paint the foreground. The method
  /// takes in a [Canvas] object and a [Size] object as arguments. The canvas is
  /// used to paint the sketch, while the size determines the size of the canvas.
  //
  // The method first checks if there is an active sketch and if not, it returns.
  // The sketch is obtained from the `state` object and passed to the [SketchFactory]
  // to be painted on the canvas.
  @override
  void paint(Canvas canvas, Size size) {
    // print("Foreground size: $size");
    // canvas.clipRect(Offset.zero & size);
    final sketch = state.activeSketch;
    if (sketch == null) return;

    final factory = SketchFactory.withDefaults(state.sketchFactory);
    factory.find(sketch.name)?.paint(canvas, sketch);
  }

  /// This method returns a boolean value indicating if the painter should be
  /// repainted. In this implementation, it always returns true.
  @override
  bool shouldRepaint(covariant ForegroundPainter oldDelegate) {
    return true;
  }
}
