import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

/// This class represents a point in 2d plane.
@freezed
class Point with _$Point {
  const Point._();
  const factory Point({
    required double x,
    required double y,
  }) = _Point;

  Point respectTo(Size origin) => Point(
        x: x / origin.width,
        y: y / origin.height,
      );

  /// Creates a Point object from JSON object.
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
