import 'package:flutter_whiteboard/domain/entities/eraser_tool_painter.dart';
import 'package:flutter_whiteboard/domain/entities/marker_tool_painter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pen_tool_painter.dart';
import 'sketch_painter.dart';

part 'sketch_factory.freezed.dart';

/// The [SketchFactory] class is a factory class that creates instances of
/// [SketchPainter] objects. It provides a convenient way to store a set of
/// [SketchPainter] objects and perform operations on them.
@freezed
class SketchFactory with _$SketchFactory {
  /// A private constructor.
  const SketchFactory._();

  /// A constructor to create an instance of [SketchFactory] with a given set of
  /// [SketchPainter] objects.
  const factory SketchFactory(Set<SketchPainter> painters) = _SketchFactory;

  /// A constructor to create an instance of [SketchFactory] with a default set
  /// of [SketchPainter] objects ([PenTool], [MarkerTool], and [EraserTool]).
  /// The default set can be overridden by passing a custom set of [SketchPainter]
  /// objects to the painters parameter.
  const factory SketchFactory.initial(
      {@Default({
        PenTool(),
        MarkerTool(),
        EraserTool(),
      })
          Set<SketchPainter> painters}) = _SketchFactoryInitial;

  /// Returns a single [SketchPainter] object that matches the given name.
  /// Returns null if no such object is found.
  SketchPainter? find(String name) {
    try {
      return painters.singleWhere((element) => element.name == name);
    } on Exception catch (e) {
      return null;
    }
  }

  /// Returns a new [SketchFactory] object that combines the default set of
  /// [SketchPainter] objects with the set of [SketchPainter] objects from the
  /// given [SketchFactory] object. The result is a new [SketchFactory] object
  /// with the combined set of [SketchPainter] objects.
  factory SketchFactory.withDefaults(SketchFactory factory) {
    final initialPainters = const SketchFactory.initial().painters;
    final userPainters = factory.painters;
    return SketchFactory({...initialPainters, ...userPainters});
  }
}
