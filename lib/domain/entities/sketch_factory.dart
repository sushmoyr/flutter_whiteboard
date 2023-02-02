import 'package:freezed_annotation/freezed_annotation.dart';

import 'pen_tool_painter.dart';
import 'sketch_painter.dart';

part 'sketch_factory.freezed.dart';

@freezed
class SketchFactory with _$SketchFactory {
  const SketchFactory._();

  const factory SketchFactory(Set<SketchPainter> painters) = _SketchFactory;

  const factory SketchFactory.initial(
          {@Default({PenTool()}) Set<SketchPainter> painters}) =
      _SketchFactoryInitial;

  SketchPainter? find(String name) {
    try {
      return painters.singleWhere((element) => element.name == name);
    } on Exception catch (e) {
      return null;
    }
  }
}
