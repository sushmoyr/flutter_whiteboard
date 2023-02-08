import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/data/data.dart';
import 'package:flutter_whiteboard/domain/domain.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_state.dart';

import '../../core/history_state_notifier_mixin.dart';

final whiteboardControllerProvider =
    StateNotifierProvider<WhiteboardController, WhiteboardState>((ref) {
  throw UnimplementedError();
});

/// A class representing the size of a page.
abstract class PageSize {
  /// The width of the page.
  final double width;

  /// The height of the page.
  final double height;

  /// Creates a new instance of [PageSize] with the specified [width] and [height].
  const PageSize(this.width, this.height);

  /// The aspect ratio of the page, calculated as [width] / [height].
  double get ratio => width / height;
}

/// Class [A4Page] extends class [PageSize] and creates an instance of an A4 size
/// paper, representing it's [width] and [height].
class A4Page extends PageSize {
  const A4Page() : super(2480, 3508);
}

/// A Flutter class that extends [StateNotifier<WhiteboardState>] and implements
/// the [HistoryStateNotifierMixin<WhiteboardState>] mixin. This class is used
/// to control the state of the whiteboard, which is represented by the
/// [WhiteboardState] object.
class WhiteboardController extends StateNotifier<WhiteboardState>
    with HistoryStateNotifierMixin<WhiteboardState> {
  /// This constructor creates a new instance of the [WhiteboardController] class,
  /// with the [WhiteboardState] initialized to a drawing state. The size of the
  /// board can be specified through the [pageSize] parameter, or it will default
  /// to the size of an A4 page. The [sketchFactory] parameter can be used to
  /// specify a custom sketch factory, or it will default to the [SketchFactory.initial()]
  /// factory.
  WhiteboardController({
    PageSize? pageSize,
    SketchFactory? sketchFactory,
  }) : super(
          WhiteboardState.drawing(
            board: Board.empty(
              width: pageSize?.width ?? A4Page().width,
              height: pageSize?.height ?? A4Page().height,
            ),
            sketchFactory: sketchFactory ?? const SketchFactory.initial(),
          ),
        );

  /// This constructor creates a new instance of the [WhiteboardController] class,
  /// with the [WhiteboardState] initialized to a drawing state based on the
  /// specified [board] object. The [sketchFactory] parameter can be used to
  /// specify a custom sketch factory, or it will default to the
  /// [SketchFactory.initial()] factory.
  WhiteboardController.fromDocument({
    required Board board,
    SketchFactory? sketchFactory,
  }) : super(
          WhiteboardState.drawing(
            board: board,
            sketchFactory: sketchFactory ?? const SketchFactory.initial(),
          ),
        );

  /// A boolean property that indicates if the current state of the whiteboard
  /// is in moving mode.
  bool get isMoving => state is Moving;

  /// A boolean property that indicates if the current state of the whiteboard
  /// is in drawing mode.
  bool get isDrawing => state is Drawing;

  /// A property that returns the current Board object associated with the whiteboard.
  Board get board => state.board;

  /// A method that returns `true` if the specified [name] matches the [name]
  /// of the currently selected sketch, or `false` otherwise.
  bool isToolSelected(String name) => state.selectedSketch == name;

  /// A method that is called when a pointer is pressed down on the whiteboard.
  /// The [PointerDownEvent] is passed as parameter.
  void onPointerDown(PointerDownEvent event) {
    // print('Pointer down at: ${event.localPosition}');
    temporaryState = state.map(
      drawing: (drawing) {
        Sketch sketch = _createNewSketch(drawing);
        return drawing.copyWith(activeSketch: sketch);
      },
      moving: (moving) => moving,
    );
  }

  /// A method that is called when a pointer moves on the whiteboard.
  /// The [PointerMoveEvent] is passed as parameter.
  void onPointerMove(PointerMoveEvent event) {
    temporaryState = state.map(
      drawing: (drawing) {
        WhiteboardState tempState = drawing;
        if (drawing.activeSketch == null) {
          tempState = drawing.copyWith(activeSketch: _createNewSketch(drawing));
        }

        Point point = event.localPosition.asPoint;
        // print("Point to insert: $pointI");
        final newSketch = tempState.sketchFactory
            .find(tempState.activeSketch!.name)
            ?.build(tempState.activeSketch!, point);

        return tempState.copyWith(activeSketch: newSketch);
      },
      moving: (moving) => moving,
      // moving: (moving) {
      //   Offset delta = event.delta;
      //   Offset translation = state.translation + delta;
      //   return moving.copyWith(
      //     translation: translation,
      //   );
      // },
    );
  }

  /// A method that is called when a pointer is released from the whiteboard.
  /// The [PointerUpEvent] is passed as parameter.
  void onPointerUp(PointerUpEvent event) {
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
    // print("Added to history");
  }

  /// A method that selects the sketch with the specified [name] as the active sketch.
  void selectSketch(String name) {
    temporaryState = WhiteboardState.drawing(
      board: state.board,
      activeSketch: state.activeSketch,
      sketchFactory: state.sketchFactory,
      selectedAttributes: state.selectedAttributes,
      selectedSketch: name,
    );
  }

  /// A method that sets the current state of the whiteboard to moving mode.
  void selectMoveMode() {
    temporaryState = WhiteboardState.moving(
      board: state.board,
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
    temporaryState = state.map(
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
}
