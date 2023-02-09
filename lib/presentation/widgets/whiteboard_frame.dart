import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/presentation/widgets/foreground_whiteboard.dart';

import '../../data/data.dart';
import 'background_whiteboard.dart';

class WhiteboardFrame extends StatelessWidget {
  const WhiteboardFrame({
    super.key,
    required this.board,
    this.readOnly = false,
  });

  final Board board;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: board.ratio,
      child: FittedBox(
        child: SizedBox(
          width: board.width,
          height: board.height,
          child: Stack(
            children: [
              BackgroundWhiteboard(size: board.size),
              if (!readOnly) ForegroundArtboard(size: board.size),
            ],
          ),
        ),
      ),
    );
  }
}
