// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageSize _$PageSizeFromJson(Map<String, dynamic> json) {
  return _PageSize.fromJson(json);
}

/// @nodoc
mixin _$PageSize {
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageSizeCopyWith<PageSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageSizeCopyWith<$Res> {
  factory $PageSizeCopyWith(PageSize value, $Res Function(PageSize) then) =
      _$PageSizeCopyWithImpl<$Res, PageSize>;
  @useResult
  $Res call({double width, double height});
}

/// @nodoc
class _$PageSizeCopyWithImpl<$Res, $Val extends PageSize>
    implements $PageSizeCopyWith<$Res> {
  _$PageSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageSizeCopyWith<$Res> implements $PageSizeCopyWith<$Res> {
  factory _$$_PageSizeCopyWith(
          _$_PageSize value, $Res Function(_$_PageSize) then) =
      __$$_PageSizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double width, double height});
}

/// @nodoc
class __$$_PageSizeCopyWithImpl<$Res>
    extends _$PageSizeCopyWithImpl<$Res, _$_PageSize>
    implements _$$_PageSizeCopyWith<$Res> {
  __$$_PageSizeCopyWithImpl(
      _$_PageSize _value, $Res Function(_$_PageSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$_PageSize(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageSize extends _PageSize {
  const _$_PageSize({required this.width, required this.height}) : super._();

  factory _$_PageSize.fromJson(Map<String, dynamic> json) =>
      _$$_PageSizeFromJson(json);

  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'PageSize(width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageSize &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageSizeCopyWith<_$_PageSize> get copyWith =>
      __$$_PageSizeCopyWithImpl<_$_PageSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageSizeToJson(
      this,
    );
  }
}

abstract class _PageSize extends PageSize {
  const factory _PageSize(
      {required final double width,
      required final double height}) = _$_PageSize;
  const _PageSize._() : super._();

  factory _PageSize.fromJson(Map<String, dynamic> json) = _$_PageSize.fromJson;

  @override
  double get width;
  @override
  double get height;
  @override
  @JsonKey(ignore: true)
  _$$_PageSizeCopyWith<_$_PageSize> get copyWith =>
      throw _privateConstructorUsedError;
}
