import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';
import 'package:flutter_whiteboard/presentation/widgets/whiteboard_frame.dart';

/// The widget that displays the whiteboard on which users can draw. This widget
/// takes a controller of type [WhiteboardController] that takes care of the drawing
/// and painting operations. By default this widget takes all the available space
///  similar to how [SizedBox.expand] works.
class Whiteboard extends StatelessWidget {
  /// The default constructor for this widget. Takes a controller of type [WhiteboardController]
  ///  and an optional canvasKey which is used in the repaint boundary widget
  ///  inside.
  const Whiteboard({
    Key? key,
    required this.controller,
    this.canvasKey,
  })  : _readOnly = false,
        super(key: key);

  // /// The named constructor that is used for previewing any existing whiteboard
  // /// data via the supplied controller of type [WhiteboardController]. No drawing
  // /// operations are supported when the widget is created using this constructor.
  // const Whiteboard.preview({
  //   super.key,
  // })  : _readOnly = true,
  //       canvasKey = null,
  //       controller = null;

  /// The controller that controls this whiteboard.
  final WhiteboardController controller;

  /// Whether this widget supports drawing operations or not. If read only is set
  /// to true, no drawing operations are made. The [Whiteboard.preview] constructor
  /// sets this value to true.
  final bool _readOnly;

  /// An optional key which is used in the repaint boundary widget inside.
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

/// The internal private widget which extends the [ConsumerWidget]. This widget
/// is the starting point for all the operations that happen inside.
class _Whiteboard extends ConsumerWidget {
  const _Whiteboard({
    Key? key,
    required this.readOnly,
    required this.canvasKey,
  }) : super(key: key);

  /// Whether this widget supports drawing operations or not. If read only is set
  /// to true, no drawing operations are made.
  final bool readOnly;

  /// An optional key which is used in the repaint boundary widget inside.
  final GlobalKey? canvasKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(whiteboardControllerProvider);
    final board = state.board;
    final controller = ref.read(whiteboardControllerProvider.notifier);
    // print("w: ${board.width} h: ${board.height}");
    return SizedBox.expand(
      child: InteractiveViewer(
        scaleEnabled: controller.isMoving,
        panEnabled: controller.isMoving,
        // alignment: Alignment.center,
        maxScale: 5,
        minScale: 0.5,
        child: RepaintBoundary(
          key: canvasKey,
          child: WhiteboardFrame(
            board: board,
          ),
        ),
      ),
    );
  }
}
