// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
class _$WorkoutTearOff {
  const _$WorkoutTearOff();

  _Workout call(
      {String? name,
      required String uuid,
      List<Exercise> exercises = const [],
      String? description,
      int dificultyLevel = 1}) {
    return _Workout(
      name: name,
      uuid: uuid,
      exercises: exercises,
      description: description,
      dificultyLevel: dificultyLevel,
    );
  }

  Workout fromJson(Map<String, Object?> json) {
    return Workout.fromJson(json);
  }
}

/// @nodoc
const $Workout = _$WorkoutTearOff();

/// @nodoc
mixin _$Workout {
  String? get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get dificultyLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String uuid,
      List<Exercise> exercises,
      String? description,
      int dificultyLevel});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res> implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  final Workout _value;
  // ignore: unused_field
  final $Res Function(Workout) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? exercises = freezed,
    Object? description = freezed,
    Object? dificultyLevel = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dificultyLevel: dificultyLevel == freezed
          ? _value.dificultyLevel
          : dificultyLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$WorkoutCopyWith(_Workout value, $Res Function(_Workout) then) =
      __$WorkoutCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String uuid,
      List<Exercise> exercises,
      String? description,
      int dificultyLevel});
}

/// @nodoc
class __$WorkoutCopyWithImpl<$Res> extends _$WorkoutCopyWithImpl<$Res>
    implements _$WorkoutCopyWith<$Res> {
  __$WorkoutCopyWithImpl(_Workout _value, $Res Function(_Workout) _then)
      : super(_value, (v) => _then(v as _Workout));

  @override
  _Workout get _value => super._value as _Workout;

  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? exercises = freezed,
    Object? description = freezed,
    Object? dificultyLevel = freezed,
  }) {
    return _then(_Workout(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dificultyLevel: dificultyLevel == freezed
          ? _value.dificultyLevel
          : dificultyLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workout extends _Workout {
  const _$_Workout(
      {this.name,
      required this.uuid,
      this.exercises = const [],
      this.description,
      this.dificultyLevel = 1})
      : super._();

  factory _$_Workout.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutFromJson(json);

  @override
  final String? name;
  @override
  final String uuid;
  @JsonKey()
  @override
  final List<Exercise> exercises;
  @override
  final String? description;
  @JsonKey()
  @override
  final int dificultyLevel;

  @override
  String toString() {
    return 'Workout(name: $name, uuid: $uuid, exercises: $exercises, description: $description, dificultyLevel: $dificultyLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Workout &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.exercises, exercises) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.dificultyLevel, dificultyLevel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(exercises),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(dificultyLevel));

  @JsonKey(ignore: true)
  @override
  _$WorkoutCopyWith<_Workout> get copyWith =>
      __$WorkoutCopyWithImpl<_Workout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutToJson(this);
  }
}

abstract class _Workout extends Workout {
  const factory _Workout(
      {String? name,
      required String uuid,
      List<Exercise> exercises,
      String? description,
      int dificultyLevel}) = _$_Workout;
  const _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$_Workout.fromJson;

  @override
  String? get name;
  @override
  String get uuid;
  @override
  List<Exercise> get exercises;
  @override
  String? get description;
  @override
  int get dificultyLevel;
  @override
  @JsonKey(ignore: true)
  _$WorkoutCopyWith<_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}
