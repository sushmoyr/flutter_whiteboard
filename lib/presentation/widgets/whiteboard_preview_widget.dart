import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/data/data.dart';
import 'package:flutter_whiteboard/domain/domain.dart';
import 'package:flutter_whiteboard/presentation/controllers/background_whiteboard_painter.dart';

class WhiteboardPreview extends StatelessWidget {
  const WhiteboardPreview({
    super.key,
    required this.board,
    this.factory = const SketchFactory.initial(),
  });

  final Board board;
  final SketchFactory factory;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: board.ratio,
      child: FittedBox(
        child: SizedBox.fromSize(
          size: board.size,
          child: CustomPaint(
            size: board.size,
            painter: BackgroundWhiteboardPainter(
              board: board,
              sketchFactory: factory,
            ),
          ),
        ),
      ),
    );
  }
}
