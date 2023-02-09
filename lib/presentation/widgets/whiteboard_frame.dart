import 'package:flutter/material.dart';

import '../../data/data.dart';
import 'background_whiteboard.dart';

class WhiteboardFrame extends StatelessWidget {
  const WhiteboardFrame({
    super.key,
    required this.board,
  });

  final Board board;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: board.ratio,
      child: FittedBox(
        child: SizedBox(
          width: board.width,
          height: board.height,
          child: BackgroundWhiteboard(size: board.size),
        ),
      ),
    );
  }
}
