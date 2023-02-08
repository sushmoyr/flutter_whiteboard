import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../sketch/sketch.dart';

part 'board.freezed.dart';
part 'board.g.dart';

/// The Board class represents a whiteboard with properties of width, height and
/// a list of sketches. width and height are the width and height of the whiteboard
/// respectively. They are required to create a Board instance. sketches is a
/// list of Sketch objects. It represents the drawings made on the whiteboard.
/// By default, it is an empty list [].
@freezed
class Board with _$Board {
  const Board._();
  const factory Board({
    required double width,
    required double height,
    @Default([]) List<Sketch> sketches,
  }) = _Board;

  /// Creates an empty board with default values.
  const factory Board.empty({
    @Default(2480.0) double width,
    @Default(3508.0) double height,
    @Default([]) List<Sketch> sketches,
  }) = _InitialBoard;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  /// Gets the size of this whiteboard in [Size] object.
  Size get size => Size(width, height);

  /// Gets the aspect ratio of this whiteboard.
  double get ratio => width / height;
}
