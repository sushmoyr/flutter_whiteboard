import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../attributes/attributes.dart';
import '../point/point.dart';

part 'sketch.freezed.dart';
part 'sketch.g.dart';

@freezed
class Sketch with _$Sketch {
  const factory Sketch({
    required String name,
    required List<Point> points,
    @Default(Attributes.initial()) Attributes attributes,
  }) = _Sketch;

  factory Sketch.fromJson(Map<String, dynamic> json) => _$SketchFromJson(json);
}
