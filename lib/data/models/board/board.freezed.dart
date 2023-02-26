// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  PageSize get pageSize => throw _privateConstructorUsedError;
  List<Sketch> get sketches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call({PageSize pageSize, List<Sketch> sketches});

  $PageSizeCopyWith<$Res> get pageSize;
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? sketches = null,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as PageSize,
      sketches: null == sketches
          ? _value.sketches
          : sketches // ignore: cast_nullable_to_non_nullable
              as List<Sketch>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageSizeCopyWith<$Res> get pageSize {
    return $PageSizeCopyWith<$Res>(_value.pageSize, (value) {
      return _then(_value.copyWith(pageSize: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$_BoardCopyWith(_$_Board value, $Res Function(_$_Board) then) =
      __$$_BoardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageSize pageSize, List<Sketch> sketches});

  @override
  $PageSizeCopyWith<$Res> get pageSize;
}

/// @nodoc
class __$$_BoardCopyWithImpl<$Res> extends _$BoardCopyWithImpl<$Res, _$_Board>
    implements _$$_BoardCopyWith<$Res> {
  __$$_BoardCopyWithImpl(_$_Board _value, $Res Function(_$_Board) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? sketches = null,
  }) {
    return _then(_$_Board(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as PageSize,
      sketches: null == sketches
          ? _value._sketches
          : sketches // ignore: cast_nullable_to_non_nullable
              as List<Sketch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Board extends _Board {
  const _$_Board(
      {this.pageSize = a4Page, final List<Sketch> sketches = const []})
      : _sketches = sketches,
        super._();

  factory _$_Board.fromJson(Map<String, dynamic> json) =>
      _$$_BoardFromJson(json);

  @override
  @JsonKey()
  final PageSize pageSize;
  final List<Sketch> _sketches;
  @override
  @JsonKey()
  List<Sketch> get sketches {
    if (_sketches is EqualUnmodifiableListView) return _sketches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sketches);
  }

  @override
  String toString() {
    return 'Board(pageSize: $pageSize, sketches: $sketches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Board &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._sketches, _sketches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageSize, const DeepCollectionEquality().hash(_sketches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      __$$_BoardCopyWithImpl<_$_Board>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardToJson(
      this,
    );
  }
}

abstract class _Board extends Board {
  const factory _Board({final PageSize pageSize, final List<Sketch> sketches}) =
      _$_Board;
  const _Board._() : super._();

  factory _Board.fromJson(Map<String, dynamic> json) = _$_Board.fromJson;

  @override
  PageSize get pageSize;
  @override
  List<Sketch> get sketches;
  @override
  @JsonKey(ignore: true)
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      throw _privateConstructorUsedError;
}
