import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/data/data.dart';

import '../controllers/whiteboard_controller.dart';
import '../controllers/whiteboard_state.dart';
import 'whiteboard_frame.dart';

class WhiteboardPreview extends StatelessWidget {
  const WhiteboardPreview({Key? key, this.onTap, required this.board})
      : super(key: key);

  final Board board;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    print("$runtimeType: ${board.sketches.length}");
    return ProviderScope(
      overrides: [
        whiteboardControllerProvider.overrideWithProvider(
            StateNotifierProvider<WhiteboardController, WhiteboardState>(
                (ref) => WhiteboardController.fromDocument(board: board))),
      ],
      child: _WhiteboardPreview(
        onTap: onTap,
        board: board,
      ),
    );
  }

  // @override
  // State<WhiteboardPreview> createState() => _WhiteboardPreviewState();
}

// class _WhiteboardPreviewState extends State<WhiteboardPreview> {
//   late WhiteboardController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = WhiteboardController.fromDocument(board: widget.board);
//   }
//
//   @override
//   void didUpdateWidget(covariant WhiteboardPreview oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.board != oldWidget.board) {
//       print("Widget updated");
//       controller = WhiteboardController.fromDocument(board: widget.board);
//       // setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("Building");
//     print(controller.board.sketches.length);
//     return ProviderScope(
//       overrides: [
//         whiteboardControllerProvider.overrideWith((ref) => controller),
//       ],
//       child: _WhiteboardPreview(
//         onTap: widget.onTap,
//       ),
//     );
//   }
// }

class _WhiteboardPreview extends ConsumerWidget {
  const _WhiteboardPreview({
    Key? key,
    this.onTap,
    required this.board,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Board board;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final board = ref.watch(whiteboardControllerProvider).board;
    print("$runtimeType: ${board.sketches.length}");

    final frame = WhiteboardFrame(
      board: board,
      readOnly: true,
    );
    const heroTag = "WhiteboardPreview";

    return GestureDetector(onTap: onTap, child: frame);

    // void openInFullScreen() {
    //   final route = MaterialPageRoute(
    //     builder: (_) => ProviderScope(
    //       child: Material(
    //         child: Hero(
    //           tag: heroTag,
    //           child: InteractiveViewer(
    //             maxScale: 5,
    //             minScale: 0.5,
    //             child: frame,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    //   Navigator.push(context, route);
    // }

    // return Material(
    //   child: Hero(
    //     tag: heroTag,
    //     child: InkWell(
    //       onTap: openInFullScreen,
    //       child: frame,
    //     ),
    //   ),
    // );
  }
}
