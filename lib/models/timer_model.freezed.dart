// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) {
  return _TimerModel.fromJson(json);
}

/// @nodoc
class _$TimerModelTearOff {
  const _$TimerModelTearOff();

  _TimerModel call(
      {required int timeToCount,
      required String? timeLeft,
      required TimerState timerState,
      required int duration}) {
    return _TimerModel(
      timeToCount: timeToCount,
      timeLeft: timeLeft,
      timerState: timerState,
      duration: duration,
    );
  }

  TimerModel fromJson(Map<String, Object?> json) {
    return TimerModel.fromJson(json);
  }
}

/// @nodoc
const $TimerModel = _$TimerModelTearOff();

/// @nodoc
mixin _$TimerModel {
  int get timeToCount => throw _privateConstructorUsedError;
  String? get timeLeft => throw _privateConstructorUsedError;
  TimerState get timerState => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerModelCopyWith<TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerModelCopyWith<$Res> {
  factory $TimerModelCopyWith(
          TimerModel value, $Res Function(TimerModel) then) =
      _$TimerModelCopyWithImpl<$Res>;
  $Res call(
      {int timeToCount, String? timeLeft, TimerState timerState, int duration});
}

/// @nodoc
class _$TimerModelCopyWithImpl<$Res> implements $TimerModelCopyWith<$Res> {
  _$TimerModelCopyWithImpl(this._value, this._then);

  final TimerModel _value;
  // ignore: unused_field
  final $Res Function(TimerModel) _then;

  @override
  $Res call({
    Object? timeToCount = freezed,
    Object? timeLeft = freezed,
    Object? timerState = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      timeToCount: timeToCount == freezed
          ? _value.timeToCount
          : timeToCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: timeLeft == freezed
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      timerState: timerState == freezed
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimerModelCopyWith<$Res> implements $TimerModelCopyWith<$Res> {
  factory _$TimerModelCopyWith(
          _TimerModel value, $Res Function(_TimerModel) then) =
      __$TimerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int timeToCount, String? timeLeft, TimerState timerState, int duration});
}

/// @nodoc
class __$TimerModelCopyWithImpl<$Res> extends _$TimerModelCopyWithImpl<$Res>
    implements _$TimerModelCopyWith<$Res> {
  __$TimerModelCopyWithImpl(
      _TimerModel _value, $Res Function(_TimerModel) _then)
      : super(_value, (v) => _then(v as _TimerModel));

  @override
  _TimerModel get _value => super._value as _TimerModel;

  @override
  $Res call({
    Object? timeToCount = freezed,
    Object? timeLeft = freezed,
    Object? timerState = freezed,
    Object? duration = freezed,
  }) {
    return _then(_TimerModel(
      timeToCount: timeToCount == freezed
          ? _value.timeToCount
          : timeToCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: timeLeft == freezed
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String?,
      timerState: timerState == freezed
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerModel extends _TimerModel {
  const _$_TimerModel(
      {required this.timeToCount,
      required this.timeLeft,
      required this.timerState,
      required this.duration})
      : super._();

  factory _$_TimerModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimerModelFromJson(json);

  @override
  final int timeToCount;
  @override
  final String? timeLeft;
  @override
  final TimerState timerState;
  @override
  final int duration;

  @override
  String toString() {
    return 'TimerModel(timeToCount: $timeToCount, timeLeft: $timeLeft, timerState: $timerState, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerModel &&
            const DeepCollectionEquality()
                .equals(other.timeToCount, timeToCount) &&
            const DeepCollectionEquality().equals(other.timeLeft, timeLeft) &&
            const DeepCollectionEquality()
                .equals(other.timerState, timerState) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timeToCount),
      const DeepCollectionEquality().hash(timeLeft),
      const DeepCollectionEquality().hash(timerState),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$TimerModelCopyWith<_TimerModel> get copyWith =>
      __$TimerModelCopyWithImpl<_TimerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerModelToJson(this);
  }
}

abstract class _TimerModel extends TimerModel {
  const factory _TimerModel(
      {required int timeToCount,
      required String? timeLeft,
      required TimerState timerState,
      required int duration}) = _$_TimerModel;
  const _TimerModel._() : super._();

  factory _TimerModel.fromJson(Map<String, dynamic> json) =
      _$_TimerModel.fromJson;

  @override
  int get timeToCount;
  @override
  String? get timeLeft;
  @override
  TimerState get timerState;
  @override
  int get duration;
  @override
  @JsonKey(ignore: true)
  _$TimerModelCopyWith<_TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
