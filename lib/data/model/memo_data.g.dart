// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoDataImpl _$$MemoDataImplFromJson(Map<String, dynamic> json) =>
    _$MemoDataImpl(
      title: json['title'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      backgroundColorValue: json['backgroundColorValue'] as String? ?? '',
      createdTimeValue: json['createdTimeValue'] as String? ?? '',
    );

Map<String, dynamic> _$$MemoDataImplToJson(_$MemoDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'backgroundColorValue': instance.backgroundColorValue,
      'createdTimeValue': instance.createdTimeValue,
    };
