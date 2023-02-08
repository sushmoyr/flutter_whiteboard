import 'dart:ui';

import '../../data/data.dart';

/// [Point] to [Offset] converter extension.
extension PointToOffset on Point {
  /// converts [Point] to [Offset] and returns the value.
  Offset get asOffset => Offset(x, y);
}

/// [Offset] to [Point] converter extension.
extension OffsetToPoint on Offset {
  /// converts [Offset] to [Point] and returns the value.
  Point get asPoint => Point(x: dx, y: dy);
}
