// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemoData _$MemoDataFromJson(Map<String, dynamic> json) {
  return _MemoData.fromJson(json);
}

/// @nodoc
mixin _$MemoData {
  String get title => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get backgroundColorValue => throw _privateConstructorUsedError;
  String get createdTimeValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoDataCopyWith<MemoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoDataCopyWith<$Res> {
  factory $MemoDataCopyWith(MemoData value, $Res Function(MemoData) then) =
      _$MemoDataCopyWithImpl<$Res, MemoData>;
  @useResult
  $Res call(
      {String title,
      String detail,
      String backgroundColorValue,
      String createdTimeValue});
}

/// @nodoc
class _$MemoDataCopyWithImpl<$Res, $Val extends MemoData>
    implements $MemoDataCopyWith<$Res> {
  _$MemoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? detail = null,
    Object? backgroundColorValue = null,
    Object? createdTimeValue = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColorValue: null == backgroundColorValue
          ? _value.backgroundColorValue
          : backgroundColorValue // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeValue: null == createdTimeValue
          ? _value.createdTimeValue
          : createdTimeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoDataImplCopyWith<$Res>
    implements $MemoDataCopyWith<$Res> {
  factory _$$MemoDataImplCopyWith(
          _$MemoDataImpl value, $Res Function(_$MemoDataImpl) then) =
      __$$MemoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String detail,
      String backgroundColorValue,
      String createdTimeValue});
}

/// @nodoc
class __$$MemoDataImplCopyWithImpl<$Res>
    extends _$MemoDataCopyWithImpl<$Res, _$MemoDataImpl>
    implements _$$MemoDataImplCopyWith<$Res> {
  __$$MemoDataImplCopyWithImpl(
      _$MemoDataImpl _value, $Res Function(_$MemoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? detail = null,
    Object? backgroundColorValue = null,
    Object? createdTimeValue = null,
  }) {
    return _then(_$MemoDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColorValue: null == backgroundColorValue
          ? _value.backgroundColorValue
          : backgroundColorValue // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeValue: null == createdTimeValue
          ? _value.createdTimeValue
          : createdTimeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoDataImpl implements _MemoData {
  const _$MemoDataImpl(
      {this.title = '',
      this.detail = '',
      this.backgroundColorValue = '',
      this.createdTimeValue = ''});

  factory _$MemoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoDataImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey()
  final String backgroundColorValue;
  @override
  @JsonKey()
  final String createdTimeValue;

  @override
  String toString() {
    return 'MemoData(title: $title, detail: $detail, backgroundColorValue: $backgroundColorValue, createdTimeValue: $createdTimeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.backgroundColorValue, backgroundColorValue) ||
                other.backgroundColorValue == backgroundColorValue) &&
            (identical(other.createdTimeValue, createdTimeValue) ||
                other.createdTimeValue == createdTimeValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, detail, backgroundColorValue, createdTimeValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoDataImplCopyWith<_$MemoDataImpl> get copyWith =>
      __$$MemoDataImplCopyWithImpl<_$MemoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoDataImplToJson(
      this,
    );
  }
}

abstract class _MemoData implements MemoData {
  const factory _MemoData(
      {final String title,
      final String detail,
      final String backgroundColorValue,
      final String createdTimeValue}) = _$MemoDataImpl;

  factory _MemoData.fromJson(Map<String, dynamic> json) =
      _$MemoDataImpl.fromJson;

  @override
  String get title;
  @override
  String get detail;
  @override
  String get backgroundColorValue;
  @override
  String get createdTimeValue;
  @override
  @JsonKey(ignore: true)
  _$$MemoDataImplCopyWith<_$MemoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
