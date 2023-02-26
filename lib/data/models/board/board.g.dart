// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Board _$$_BoardFromJson(Map<String, dynamic> json) => _$_Board(
      pageSize: json['pageSize'] == null
          ? a4Page
          : PageSize.fromJson(json['pageSize'] as Map<String, dynamic>),
      sketches: (json['sketches'] as List<dynamic>?)
              ?.map((e) => Sketch.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BoardToJson(_$_Board instance) => <String, dynamic>{
      'pageSize': instance.pageSize.toJson(),
      'sketches': instance.sketches.map((e) => e.toJson()).toList(),
    };
