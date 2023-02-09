import 'dart:ui';

import 'package:flutter_whiteboard/data/data.dart';
import 'package:flutter_whiteboard/domain/entities/sketch_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'whiteboard_state.freezed.dart';

/// This class is an implementation of the freezed package and provides two
/// state management options for a whiteboard application in Flutter, Drawing and Moving.
@freezed
class WhiteboardState with _$WhiteboardState {
  /// This constructor creates a [WhiteboardState] object in the [Drawing] state.
  /// It takes in the following parameters:
  ///
  /// - `board`: The Board object that contains all sketches in the whiteboard. Defaults to an empty Board object.
  //  - `activeSketch`: The current active sketch being drawn. Defaults to null.
  //  - `selectedSketch`: The name of the currently selected sketch tool. Defaults to 'pen'.
  //  - `selectedAttributes`: The Attributes of the currently selected sketch tool. Defaults to the initial Attributes object.
  //  - `sketchFactory`: The SketchFactory object that creates sketches. Defaults to the initial SketchFactory object.
  const factory WhiteboardState.drawing({
    @Default(Board()) Board board,
    Sketch? activeSketch,
    @Default('pen') String selectedSketch,
    @Default(Attributes.initial()) Attributes selectedAttributes,
    @Default(SketchFactory.initial()) SketchFactory sketchFactory,
  }) = Drawing;

  /// This constructor creates a WhiteboardState object in the Moving state.
  /// It takes in the following parameters:
  ///
  //  - `board`: The Board object that contains all sketches in the whiteboard. Defaults to an empty Board object.
  //  - `activeSketch`: The current active sketch being drawn. Defaults to null.
  //  - `selectedSketch`: The name of the currently selected sketch tool. Defaults to 'pen'.
  //  - `selectedAttributes`: The Attributes of the currently selected sketch tool. Defaults to the initial Attributes object.
  //  - `sketchFactory`: The SketchFactory object that creates sketches. Defaults to the initial SketchFactory object.
  const factory WhiteboardState.moving({
    @Default(Board()) Board board,
    Sketch? activeSketch,
    @Default('pen') String selectedSketch,
    @Default(Attributes.initial()) Attributes selectedAttributes,
    @Default(SketchFactory.initial()) SketchFactory sketchFactory,
  }) = Moving;
}
