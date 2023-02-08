import 'dart:ui';

/// convert an integer to a [Color] object.
extension ColorX on int {
  Color get toColor => Color(this);
}
