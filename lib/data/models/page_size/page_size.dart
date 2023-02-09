import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_size.freezed.dart';
part 'page_size.g.dart';

/// A class representing the size of a page.
@freezed
class PageSize with _$PageSize {
  const PageSize._();

  /// Creates a new instance of [PageSize] with the specified [width] and [height].
  const factory PageSize({
    required double width,
    required double height,
  }) = _PageSize;

  /// The aspect ratio of the page, calculated as [width] / [height].
  double get ratio => width / height;

  factory PageSize.fromJson(Map<String, dynamic> json) =>
      _$PageSizeFromJson(json);
}

const a4Page = PageSize(width: 2480, height: 3108);

/// Class [A4Page] extends class [PageSize] and creates an instance of an A4 size
/// paper, representing it's [width] and [height].
