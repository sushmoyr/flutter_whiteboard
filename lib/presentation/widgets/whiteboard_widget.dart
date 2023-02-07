import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/widgets/background_whiteboard.dart';
import 'package:flutter_whiteboard/presentation/widgets/foreground_whiteboard.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({
    Key? key,
    required this.controller,
    this.canvasKey,
  })  : _readOnly = false,
        super(key: key);

  const Whiteboard.preview({
    super.key,
    required this.controller,
    this.canvasKey,
  }) : _readOnly = true;

  final WhiteboardController controller;
  final bool _readOnly;
  final GlobalKey? canvasKey;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        whiteboardControllerProvider.overrideWith((ref) => controller),
      ],
      child: _Whiteboard(
        readOnly: _readOnly,
        canvasKey: canvasKey,
      ),
    );
  }
}

class _Whiteboard extends ConsumerWidget {
  const _Whiteboard({
    Key? key,
    required this.readOnly,
    required this.canvasKey,
  }) : super(key: key);

  final bool readOnly;
  final GlobalKey? canvasKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(whiteboardControllerProvider);
    final board = state.board;
    final controller = ref.read(whiteboardControllerProvider.notifier);
    print("w: ${board.width} h: ${board.height}");
    return InteractiveViewer(
      scaleEnabled: controller.isMoving,
      panEnabled: controller.isMoving,
      child: RepaintBoundary(
        key: canvasKey,
        child: AspectRatio(
          aspectRatio: board.ratio,
          child: LayoutBuilder(builder: (context, constraints) {
            final size = Size(board.width, board.height);
            print(size);
            return FittedBox(
              child: SizedBox(
                width: board.width,
                height: board.height,
                child: Stack(
                  children: [
                    BackgroundWhiteboard(size: size),
                    if (!readOnly) ForegroundArtboard(size: size)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
