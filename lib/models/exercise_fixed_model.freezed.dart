// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exercise_fixed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseFixed _$ExerciseFixedFromJson(Map<String, dynamic> json) {
  return _BreakBetweenExercises.fromJson(json);
}

/// @nodoc
class _$ExerciseFixedTearOff {
  const _$ExerciseFixedTearOff();

  _BreakBetweenExercises call(
      {required String name,
      required int estimatedTime,
      int? numberOfReps,
      String? imageUrl,
      String? props}) {
    return _BreakBetweenExercises(
      name: name,
      estimatedTime: estimatedTime,
      numberOfReps: numberOfReps,
      imageUrl: imageUrl,
      props: props,
    );
  }

  ExerciseFixed fromJson(Map<String, Object?> json) {
    return ExerciseFixed.fromJson(json);
  }
}

/// @nodoc
const $ExerciseFixed = _$ExerciseFixedTearOff();

/// @nodoc
mixin _$ExerciseFixed {
  String get name => throw _privateConstructorUsedError;
  int get estimatedTime => throw _privateConstructorUsedError;
  int? get numberOfReps => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get props => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseFixedCopyWith<ExerciseFixed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseFixedCopyWith<$Res> {
  factory $ExerciseFixedCopyWith(
          ExerciseFixed value, $Res Function(ExerciseFixed) then) =
      _$ExerciseFixedCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int estimatedTime,
      int? numberOfReps,
      String? imageUrl,
      String? props});
}

/// @nodoc
class _$ExerciseFixedCopyWithImpl<$Res>
    implements $ExerciseFixedCopyWith<$Res> {
  _$ExerciseFixedCopyWithImpl(this._value, this._then);

  final ExerciseFixed _value;
  // ignore: unused_field
  final $Res Function(ExerciseFixed) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? estimatedTime = freezed,
    Object? numberOfReps = freezed,
    Object? imageUrl = freezed,
    Object? props = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedTime: estimatedTime == freezed
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfReps: numberOfReps == freezed
          ? _value.numberOfReps
          : numberOfReps // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      props: props == freezed
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BreakBetweenExercisesCopyWith<$Res>
    implements $ExerciseFixedCopyWith<$Res> {
  factory _$BreakBetweenExercisesCopyWith(_BreakBetweenExercises value,
          $Res Function(_BreakBetweenExercises) then) =
      __$BreakBetweenExercisesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int estimatedTime,
      int? numberOfReps,
      String? imageUrl,
      String? props});
}

/// @nodoc
class __$BreakBetweenExercisesCopyWithImpl<$Res>
    extends _$ExerciseFixedCopyWithImpl<$Res>
    implements _$BreakBetweenExercisesCopyWith<$Res> {
  __$BreakBetweenExercisesCopyWithImpl(_BreakBetweenExercises _value,
      $Res Function(_BreakBetweenExercises) _then)
      : super(_value, (v) => _then(v as _BreakBetweenExercises));

  @override
  _BreakBetweenExercises get _value => super._value as _BreakBetweenExercises;

  @override
  $Res call({
    Object? name = freezed,
    Object? estimatedTime = freezed,
    Object? numberOfReps = freezed,
    Object? imageUrl = freezed,
    Object? props = freezed,
  }) {
    return _then(_BreakBetweenExercises(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedTime: estimatedTime == freezed
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfReps: numberOfReps == freezed
          ? _value.numberOfReps
          : numberOfReps // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      props: props == freezed
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BreakBetweenExercises extends _BreakBetweenExercises {
  const _$_BreakBetweenExercises(
      {required this.name,
      required this.estimatedTime,
      this.numberOfReps,
      this.imageUrl,
      this.props})
      : super._();

  factory _$_BreakBetweenExercises.fromJson(Map<String, dynamic> json) =>
      _$$_BreakBetweenExercisesFromJson(json);

  @override
  final String name;
  @override
  final int estimatedTime;
  @override
  final int? numberOfReps;
  @override
  final String? imageUrl;
  @override
  final String? props;

  @override
  String toString() {
    return 'ExerciseFixed(name: $name, estimatedTime: $estimatedTime, numberOfReps: $numberOfReps, imageUrl: $imageUrl, props: $props)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BreakBetweenExercises &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.estimatedTime, estimatedTime) &&
            const DeepCollectionEquality()
                .equals(other.numberOfReps, numberOfReps) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.props, props));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(estimatedTime),
      const DeepCollectionEquality().hash(numberOfReps),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(props));

  @JsonKey(ignore: true)
  @override
  _$BreakBetweenExercisesCopyWith<_BreakBetweenExercises> get copyWith =>
      __$BreakBetweenExercisesCopyWithImpl<_BreakBetweenExercises>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreakBetweenExercisesToJson(this);
  }
}

abstract class _BreakBetweenExercises extends ExerciseFixed {
  const factory _BreakBetweenExercises(
      {required String name,
      required int estimatedTime,
      int? numberOfReps,
      String? imageUrl,
      String? props}) = _$_BreakBetweenExercises;
  const _BreakBetweenExercises._() : super._();

  factory _BreakBetweenExercises.fromJson(Map<String, dynamic> json) =
      _$_BreakBetweenExercises.fromJson;

  @override
  String get name;
  @override
  int get estimatedTime;
  @override
  int? get numberOfReps;
  @override
  String? get imageUrl;
  @override
  String? get props;
  @override
  @JsonKey(ignore: true)
  _$BreakBetweenExercisesCopyWith<_BreakBetweenExercises> get copyWith =>
      throw _privateConstructorUsedError;
}
