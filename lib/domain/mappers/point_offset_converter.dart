import 'dart:ui';

import '../../data/data.dart';

extension PointToOffset on Point {
  Offset get asOffset => Offset(x, y);
}

extension OffsetToPoint on Offset {
  Point get asPoint => Point(x: dx, y: dy);
}
