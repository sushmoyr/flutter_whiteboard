import 'dart:ui';

import 'package:flutter_whiteboard/data/data.dart';
import 'package:flutter_whiteboard/data/models/attributes/attributes.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_board_state.freezed.dart';

/// The state of the draw board
/// Built in states are
///
/// - Drawing: Drawing shapes, lines, eraser etc
/// - Moving: Move, scale the draw board
/// - Typing (Not implemented yet)
@freezed
class DrawBoardState with _$DrawBoardState {
  const factory DrawBoardState.drawing({
    @Default(Board.empty()) Board board,
    @Default(Offset.zero) Offset translation,
    @Default(1.0) double scale,
    Sketch? activeSketch,
    @Default('scribble') String selectedSketch,
    @Default(Attributes.initial()) Attributes selectedAttributes,
    @Default(SketchFactory.initial()) SketchFactory sketchFactory,
  }) = Drawing;

  const factory DrawBoardState.moving({
    @Default(Board.empty()) Board board,
    @Default(Offset.zero) Offset translation,
    @Default(1.0) double scale,
    Sketch? activeSketch,
    @Default('scribble') String selectedSketch,
    @Default(Attributes.initial()) Attributes selectedAttributes,
    @Default(SketchFactory.initial()) SketchFactory sketchFactory,
  }) = Moving;
}
