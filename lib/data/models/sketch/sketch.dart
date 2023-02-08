import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../attributes/attributes.dart';
import '../point/point.dart';

part 'sketch.freezed.dart';
part 'sketch.g.dart';

/// The Sketch class is a model class used to store information about a drawing.
/// The class is generated using the freezed package.
@freezed
class Sketch with _$Sketch {
  const factory Sketch({
    /// a required string representing the name of the drawing.
    required String name,

    /// a required list of Point objects representing the points in the drawing.
    required List<Point> points,

    /// an optional Attributes object that stores information about the drawing
    /// style, including color and stroke width. The default value is
    @Default(Attributes.initial()) Attributes attributes,
  }) = _Sketch;

  /// The class also includes a factory constructor Sketch.fromJson which creates
  /// a Sketch object from a JSON-formatted map.
  factory Sketch.fromJson(Map<String, dynamic> json) => _$SketchFromJson(json);
}
