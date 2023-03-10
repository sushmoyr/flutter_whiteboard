import 'dart:ui';

import 'package:flutter_whiteboard/flutter_whiteboard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default(a4Page) PageSize pageSize,
    @Default([]) List<Sketch> sketches,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Size get size => Size(pageSize.width, pageSize.height);
  double get width => size.width;
  double get height => size.height;
  bool get isNotEmpty => sketches.isNotEmpty;
  bool get isEmpty => sketches.isEmpty;

  /// Gets the aspect ratio of this whiteboard.
  double get ratio => width / height;
}
