// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
class _$ExerciseTearOff {
  const _$ExerciseTearOff();

  _Exercise call(
      {required String uuid,
      required int hangingTime,
      required int restingTime,
      required int reps,
      required ExerciseState exerciseState}) {
    return _Exercise(
      uuid: uuid,
      hangingTime: hangingTime,
      restingTime: restingTime,
      reps: reps,
      exerciseState: exerciseState,
    );
  }

  Exercise fromJson(Map<String, Object?> json) {
    return Exercise.fromJson(json);
  }
}

/// @nodoc
const $Exercise = _$ExerciseTearOff();

/// @nodoc
mixin _$Exercise {
  String get uuid => throw _privateConstructorUsedError;
  int get hangingTime => throw _privateConstructorUsedError;
  int get restingTime => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  ExerciseState get exerciseState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res>;
  $Res call(
      {String uuid,
      int hangingTime,
      int restingTime,
      int reps,
      ExerciseState exerciseState});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? hangingTime = freezed,
    Object? restingTime = freezed,
    Object? reps = freezed,
    Object? exerciseState = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      hangingTime: hangingTime == freezed
          ? _value.hangingTime
          : hangingTime // ignore: cast_nullable_to_non_nullable
              as int,
      restingTime: restingTime == freezed
          ? _value.restingTime
          : restingTime // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseState: exerciseState == freezed
          ? _value.exerciseState
          : exerciseState // ignore: cast_nullable_to_non_nullable
              as ExerciseState,
    ));
  }
}

/// @nodoc
abstract class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) then) =
      __$ExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uuid,
      int hangingTime,
      int restingTime,
      int reps,
      ExerciseState exerciseState});
}

/// @nodoc
class __$ExerciseCopyWithImpl<$Res> extends _$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(_Exercise _value, $Res Function(_Exercise) _then)
      : super(_value, (v) => _then(v as _Exercise));

  @override
  _Exercise get _value => super._value as _Exercise;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? hangingTime = freezed,
    Object? restingTime = freezed,
    Object? reps = freezed,
    Object? exerciseState = freezed,
  }) {
    return _then(_Exercise(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      hangingTime: hangingTime == freezed
          ? _value.hangingTime
          : hangingTime // ignore: cast_nullable_to_non_nullable
              as int,
      restingTime: restingTime == freezed
          ? _value.restingTime
          : restingTime // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseState: exerciseState == freezed
          ? _value.exerciseState
          : exerciseState // ignore: cast_nullable_to_non_nullable
              as ExerciseState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exercise extends _Exercise {
  const _$_Exercise(
      {required this.uuid,
      required this.hangingTime,
      required this.restingTime,
      required this.reps,
      required this.exerciseState})
      : super._();

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseFromJson(json);

  @override
  final String uuid;
  @override
  final int hangingTime;
  @override
  final int restingTime;
  @override
  final int reps;
  @override
  final ExerciseState exerciseState;

  @override
  String toString() {
    return 'Exercise(uuid: $uuid, hangingTime: $hangingTime, restingTime: $restingTime, reps: $reps, exerciseState: $exerciseState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Exercise &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality()
                .equals(other.hangingTime, hangingTime) &&
            const DeepCollectionEquality()
                .equals(other.restingTime, restingTime) &&
            const DeepCollectionEquality().equals(other.reps, reps) &&
            const DeepCollectionEquality()
                .equals(other.exerciseState, exerciseState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(hangingTime),
      const DeepCollectionEquality().hash(restingTime),
      const DeepCollectionEquality().hash(reps),
      const DeepCollectionEquality().hash(exerciseState));

  @JsonKey(ignore: true)
  @override
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseToJson(this);
  }
}

abstract class _Exercise extends Exercise {
  const factory _Exercise(
      {required String uuid,
      required int hangingTime,
      required int restingTime,
      required int reps,
      required ExerciseState exerciseState}) = _$_Exercise;
  const _Exercise._() : super._();

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  String get uuid;
  @override
  int get hangingTime;
  @override
  int get restingTime;
  @override
  int get reps;
  @override
  ExerciseState get exerciseState;
  @override
  @JsonKey(ignore: true)
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}