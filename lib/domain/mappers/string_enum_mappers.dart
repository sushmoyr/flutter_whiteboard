import 'dart:ui';

/// The [StringEnumX] is an extension on the [String] class. It adds three methods,
/// `strokeCap`, `strokeJoin`, and `style`, to convert a string representation of
/// an `enumeration` value to its corresponding value of the [StrokeCap], [StrokeJoin],
/// and [PaintingStyle] enumerations, respectively. If the string representation
/// is not supported, the method will throw an [ArgumentError].
extension StringEnumX on String {
  /// The strokeCap method is a member of the StringEnumX extension on the String
  /// class. It takes the string representation of a StrokeCap enumeration value
  /// and returns the corresponding StrokeCap value. If the string representation
  /// is not supported, the method will throw an ArgumentError with a message
  /// indicating that the value is not supported.
  StrokeCap get strokeCap {
    for (StrokeCap cap in StrokeCap.values) {
      if (cap.name == this) {
        return cap;
      }
    }
    throw ArgumentError("The stroke cap value $this is not supported");
  }

  /// The strokeJoin method is a member of the StringEnumX extension on the
  /// String class. It takes the string representation of a StrokeJoin enumeration
  /// value and returns the corresponding StrokeJoin value. If the string
  /// representation is not supported, the method will throw an ArgumentError
  /// with a message indicating that the value is not supported.
  StrokeJoin get strokeJoin {
    for (StrokeJoin join in StrokeJoin.values) {
      if (join.name == this) {
        return join;
      }
    }
    throw ArgumentError("The stroke join value $this is not supported");
  }

  /// The style method is a member of the StringEnumX extension on the String class.
  /// It takes the string representation of a PaintingStyle enumeration value and
  /// returns the corresponding PaintingStyle value. If the string representation
  /// is not supported, the method will throw an ArgumentError with a message
  /// indicating that the value is not supported.
  PaintingStyle get style {
    for (PaintingStyle paintingStyle in PaintingStyle.values) {
      if (paintingStyle.name == this) {
        return paintingStyle;
      }
    }
    throw ArgumentError(
        "The stroke paintingStyle value $this is not supported");
  }
}
