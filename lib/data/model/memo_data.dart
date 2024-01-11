import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_data.freezed.dart';

part 'memo_data.g.dart';

@freezed
class MemoData with _$MemoData {
  const factory MemoData({
    @Default('') String title,
    @Default('') String detail,
    @Default('') String backgroundColorValue,
    @Default('') String createdTimeValue,
  }) = _MemoData;

  factory MemoData.fromJson(Map<String, Object?> json) => _$MemoDataFromJson(json);
}
