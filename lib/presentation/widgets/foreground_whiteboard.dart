import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';

class ForegroundArtboard extends ConsumerWidget {
  const ForegroundArtboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(whiteboardControllerProvider);
    final controller = ref.read(whiteboardControllerProvider.notifier);
    // print("Foreground artboard");
    return Listener(
      onPointerDown: (event) => controller.onPointerDown(event, size),
      onPointerUp: (event) => controller.onPointerUp(event, size),
      onPointerMove: (event) => controller.onPointerMove(event, size),
      child: CustomPaint(
        painter: ForegroundPainter(state),
        size: size,
      ),
    );
  }
}

class ForegroundPainter extends CustomPainter {
  final WhiteboardState state;

  ForegroundPainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    print("Foreground size: $size");
    canvas.clipRect(Offset.zero & size);
    final sketch = state.activeSketch;
    if (sketch == null) return;

    final factory = SketchFactory.withDefaults(state.sketchFactory);
    factory.find(sketch.name)?.paint(canvas, sketch);
  }

  @override
  bool shouldRepaint(covariant ForegroundPainter oldDelegate) {
    return true;
  }
}
