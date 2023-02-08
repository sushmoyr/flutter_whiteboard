import 'dart:ui';

import 'package:flutter/foundation.dart';
import '../../../domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributes.freezed.dart';

/// The Attributes class is a data class that stores information about the style
/// of a sketch. It is a part of the Sketch class and is used to define the
/// attributes of each point in a sketch.
@Freezed(
  fromJson: false,
  toJson: false,
  copyWith: true,
)
class Attributes with _$Attributes {
  const Attributes._();

  /// The default constructor for this class.
  /// - `strokeWidth`: The width of the stroke for the sketch
  /// - `color`: The color of the stroke for the sketch
  /// - `strokeJoin`: The type of join for the sketch
  /// - `strokeCap`: The type of cap for the stroke
  /// - `style`: The painting style for the sketch
  const factory Attributes({
    required double strokeWidth,
    required Color color,
    required StrokeJoin strokeJoin,
    required StrokeCap strokeCap,
    required PaintingStyle style,
  }) = _Attributes;

  /// The constructor for creating an instance with default values.
  const factory Attributes.initial({
    @Default(2.0) double strokeWidth,
    @Default(Color(0xFF000000)) Color color,
    @Default(StrokeJoin.round) StrokeJoin strokeJoin,
    @Default(StrokeCap.round) StrokeCap strokeCap,
    @Default(PaintingStyle.stroke) PaintingStyle style,
  }) = DefaultAttribute;

  /// Generates an instance from json document.
  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      strokeWidth: json["strokeWidth"],
      color: (json["color"] as int).toColor,
      strokeJoin: (json["strokeJoin"] as String).strokeJoin,
      strokeCap: (json["strokeCap"] as String).strokeCap,
      style: (json["style"] as String).style,
    );
  }

  /// Converts to a map to use as json.
  Map<String, dynamic> toJson() {
    return {
      "strokeWidth": strokeWidth,
      "strokeJoin": strokeJoin.name,
      "color": color.value,
      "strokeCap": strokeCap.name,
      "style": style.name,
    };
  }

  Paint get paint => Paint()
    ..style = style
    ..color = color
    ..strokeCap = strokeCap
    ..strokeJoin = strokeJoin
    ..strokeWidth = strokeWidth;
}
