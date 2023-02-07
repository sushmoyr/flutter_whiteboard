import 'package:flutter/cupertino.dart';
import 'package:flutter_whiteboard/data/core/history_state_notifier_mixin.dart';
import 'package:flutter_whiteboard/data/data.dart';
import 'package:flutter_whiteboard/domain/domain.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/attributes/attributes.dart';

final whiteboardControllerProvider =
    StateNotifierProvider<WhiteboardController, WhiteboardState>((ref) {
  throw UnimplementedError();
});

class PageSize {
  final double width;
  final double height;

  PageSize(this.width, this.height);

  double get ratio => width / height;

  static PageSize get a4 => PageSize(2480, 3508);
}

class WhiteboardController extends StateNotifier<WhiteboardState>
    with HistoryStateNotifierMixin<WhiteboardState> {
  WhiteboardController({
    PageSize? pageSize,
    SketchFactory? sketchFactory,
  }) : super(
          WhiteboardState.drawing(
            board: Board.empty(
              width: pageSize?.width ?? PageSize.a4.width,
              height: pageSize?.height ?? PageSize.a4.height,
            ),
            sketchFactory: sketchFactory ?? const SketchFactory.initial(),
          ),
        );

  WhiteboardController.fromDocument({
    required Board board,
    SketchFactory? sketchFactory,
  }) : super(
          WhiteboardState.drawing(
            board: board,
            sketchFactory: sketchFactory ?? const SketchFactory.initial(),
          ),
        );

  void onPointerDown(PointerDownEvent event, Size size) {
    print('Pointer down at: ${event.localPosition}');
    state = state.map(
      drawing: (drawing) {
        Sketch sketch = _createNewSketch(drawing);
        return drawing.copyWith(activeSketch: sketch);
      },
      moving: (moving) => moving,
    );
  }

  void onPointerMove(PointerMoveEvent event, Size size) {
    state = state.map(
      drawing: (drawing) {
        WhiteboardState tempState = drawing;
        if (drawing.activeSketch == null) {
          tempState = drawing.copyWith(activeSketch: _createNewSketch(drawing));
        }
        Offset position =
            (event.localPosition - state.translation) / state.scale;
        Point point = position.asPoint;
        Point pointI = point.respectTo(size);
        // print("Point to insert: $pointI");
        final newSketch = state.sketchFactory
            .find(state.activeSketch!.name)
            ?.build(state.activeSketch!, point);

        return tempState.copyWith(activeSketch: newSketch);
      },
      moving: (moving) {
        Offset delta = event.delta;
        Offset translation = state.translation + delta;
        return moving.copyWith(
          translation: translation,
        );
      },
    );
  }

  void onPointerUp(PointerUpEvent event, Size size) {
    state = state.map(
      drawing: (drawing) {
        if (drawing.activeSketch == null) return drawing;
        Board activeBoard = drawing.board.copyWith(
          sketches: [...drawing.board.sketches, drawing.activeSketch!],
        );
        return drawing.copyWith(board: activeBoard, activeSketch: null);
      },
      moving: (moving) => moving,
    );
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    if (details.pointerCount < 2) return;
    state = state.map(
      drawing: (drawing) => drawing,
      moving: (moving) {
        double threshold = 0.005;
        double scale = moving.scale;
        // double initialScale = scale;
        // Offset offset = moving.translation;
        // Offset focalPoint = moving.focalPoint;
        // scale = (scale * details.scale).clamp(0.5, 1.5);
        double newScale = (scale * details.scale).clamp(0.5, 1.5);

        double scaleDelta = newScale - scale;

        if (scaleDelta > threshold) {
          newScale = (scale + threshold).clamp(0.5, 1.5);
        }
        if (scaleDelta < threshold) {
          newScale = (scale - threshold).clamp(0.5, 1.5);
        }

        scale = newScale;

        return moving.copyWith(
          scale: scale,
        );
      },
    );
  }

  void selectSketch(String name) {
    state = state.copyWith(selectedSketch: name);
  }

  void selectMoveMode() {
    state = WhiteboardState.moving(
      board: state.board,
      translation: state.translation,
      scale: state.scale,
      activeSketch: state.activeSketch,
      sketchFactory: state.sketchFactory,
      selectedAttributes: state.selectedAttributes,
      selectedSketch: state.selectedSketch,
    );
  }

  void setAttribute({
    double? strokeWidth,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    PaintingStyle? style,
    Color? color,
  }) {
    state = state.map(
      drawing: (drawing) {
        Attributes currentAttrs = drawing.selectedAttributes;
        currentAttrs = currentAttrs.copyWith(
          style: style ?? currentAttrs.style,
          color: color ?? currentAttrs.color,
          strokeJoin: strokeJoin ?? currentAttrs.strokeJoin,
          strokeWidth: strokeWidth ?? currentAttrs.strokeWidth,
          strokeCap: strokeCap ?? currentAttrs.strokeCap,
        );
        return drawing.copyWith(selectedAttributes: currentAttrs);
      },
      moving: (moving) => moving,
    );
  }

  Sketch _createNewSketch(Drawing state) {
    return Sketch(
      name: state.selectedSketch,
      points: [],
      attributes: state.selectedAttributes,
    );
  }

  void setScale(double scale) => state = state.copyWith(scale: scale);

  /// Gets the board data object
  Board get data => state.board;

  /// Gets the json data
  Map<String, dynamic> get json => data.toJson();

  bool isSketchActive(String name) {
    return state.map<bool>(
      drawing: (Drawing value) => value.selectedSketch == name,
      moving: (Moving value) => false,
    );
  }

  bool get isMoving => state is Moving;

  bool get isDrawing => state is Drawing;

  Board get board => state.board;
}
