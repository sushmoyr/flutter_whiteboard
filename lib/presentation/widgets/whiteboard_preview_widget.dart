import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/data/data.dart';

import '../controllers/whiteboard_controller.dart';
import 'whiteboard_frame.dart';

class WhiteboardPreview extends StatefulWidget {
  const WhiteboardPreview({Key? key, this.onTap, required this.board})
      : super(key: key);

  final Board board;
  final VoidCallback? onTap;

  @override
  State<WhiteboardPreview> createState() => _WhiteboardPreviewState();
}

class _WhiteboardPreviewState extends State<WhiteboardPreview> {
  late final WhiteboardController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WhiteboardController.fromDocument(board: widget.board);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        whiteboardControllerProvider.overrideWith((ref) => controller),
      ],
      child: _WhiteboardPreview(
        onTap: widget.onTap,
      ),
    );
  }
}

class _WhiteboardPreview extends ConsumerWidget {
  const _WhiteboardPreview({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(whiteboardControllerProvider).board;

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
