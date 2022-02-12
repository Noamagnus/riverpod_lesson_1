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
      {String name = '',
      required String uuid,
      String? imageUrl,
      int prepareTime = 0,
      int hangingTime = 0,
      int restingTime = 0,
      int reps = 1,
      int? initialReps,
      int restAfterExercise = 0,
      required ExerciseState exerciseState,
      required ExerciseType exerciseType,
      int estimatedTime = 1,
      bool startAfterFinish = false,
      bool showDetails = true}) {
    return _Exercise(
      name: name,
      uuid: uuid,
      imageUrl: imageUrl,
      prepareTime: prepareTime,
      hangingTime: hangingTime,
      restingTime: restingTime,
      reps: reps,
      initialReps: initialReps,
      restAfterExercise: restAfterExercise,
      exerciseState: exerciseState,
      exerciseType: exerciseType,
      estimatedTime: estimatedTime,
      startAfterFinish: startAfterFinish,
      showDetails: showDetails,
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
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int get prepareTime => throw _privateConstructorUsedError;
  int get hangingTime => throw _privateConstructorUsedError;
  int get restingTime => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int? get initialReps => throw _privateConstructorUsedError;
  int get restAfterExercise => throw _privateConstructorUsedError;
  ExerciseState get exerciseState => throw _privateConstructorUsedError;
  ExerciseType get exerciseType => throw _privateConstructorUsedError;
  int get estimatedTime => throw _privateConstructorUsedError;
  bool get startAfterFinish => throw _privateConstructorUsedError;
  bool get showDetails => throw _privateConstructorUsedError;

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
      {String name,
      String uuid,
      String? imageUrl,
      int prepareTime,
      int hangingTime,
      int restingTime,
      int reps,
      int? initialReps,
      int restAfterExercise,
      ExerciseState exerciseState,
      ExerciseType exerciseType,
      int estimatedTime,
      bool startAfterFinish,
      bool showDetails});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? imageUrl = freezed,
    Object? prepareTime = freezed,
    Object? hangingTime = freezed,
    Object? restingTime = freezed,
    Object? reps = freezed,
    Object? initialReps = freezed,
    Object? restAfterExercise = freezed,
    Object? exerciseState = freezed,
    Object? exerciseType = freezed,
    Object? estimatedTime = freezed,
    Object? startAfterFinish = freezed,
    Object? showDetails = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prepareTime: prepareTime == freezed
          ? _value.prepareTime
          : prepareTime // ignore: cast_nullable_to_non_nullable
              as int,
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
      initialReps: initialReps == freezed
          ? _value.initialReps
          : initialReps // ignore: cast_nullable_to_non_nullable
              as int?,
      restAfterExercise: restAfterExercise == freezed
          ? _value.restAfterExercise
          : restAfterExercise // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseState: exerciseState == freezed
          ? _value.exerciseState
          : exerciseState // ignore: cast_nullable_to_non_nullable
              as ExerciseState,
      exerciseType: exerciseType == freezed
          ? _value.exerciseType
          : exerciseType // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      estimatedTime: estimatedTime == freezed
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      startAfterFinish: startAfterFinish == freezed
          ? _value.startAfterFinish
          : startAfterFinish // ignore: cast_nullable_to_non_nullable
              as bool,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) then) =
      __$ExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String uuid,
      String? imageUrl,
      int prepareTime,
      int hangingTime,
      int restingTime,
      int reps,
      int? initialReps,
      int restAfterExercise,
      ExerciseState exerciseState,
      ExerciseType exerciseType,
      int estimatedTime,
      bool startAfterFinish,
      bool showDetails});
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
    Object? name = freezed,
    Object? uuid = freezed,
    Object? imageUrl = freezed,
    Object? prepareTime = freezed,
    Object? hangingTime = freezed,
    Object? restingTime = freezed,
    Object? reps = freezed,
    Object? initialReps = freezed,
    Object? restAfterExercise = freezed,
    Object? exerciseState = freezed,
    Object? exerciseType = freezed,
    Object? estimatedTime = freezed,
    Object? startAfterFinish = freezed,
    Object? showDetails = freezed,
  }) {
    return _then(_Exercise(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prepareTime: prepareTime == freezed
          ? _value.prepareTime
          : prepareTime // ignore: cast_nullable_to_non_nullable
              as int,
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
      initialReps: initialReps == freezed
          ? _value.initialReps
          : initialReps // ignore: cast_nullable_to_non_nullable
              as int?,
      restAfterExercise: restAfterExercise == freezed
          ? _value.restAfterExercise
          : restAfterExercise // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseState: exerciseState == freezed
          ? _value.exerciseState
          : exerciseState // ignore: cast_nullable_to_non_nullable
              as ExerciseState,
      exerciseType: exerciseType == freezed
          ? _value.exerciseType
          : exerciseType // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      estimatedTime: estimatedTime == freezed
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      startAfterFinish: startAfterFinish == freezed
          ? _value.startAfterFinish
          : startAfterFinish // ignore: cast_nullable_to_non_nullable
              as bool,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exercise extends _Exercise {
  const _$_Exercise(
      {this.name = '',
      required this.uuid,
      this.imageUrl,
      this.prepareTime = 0,
      this.hangingTime = 0,
      this.restingTime = 0,
      this.reps = 1,
      this.initialReps,
      this.restAfterExercise = 0,
      required this.exerciseState,
      required this.exerciseType,
      this.estimatedTime = 1,
      this.startAfterFinish = false,
      this.showDetails = true})
      : super._();

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseFromJson(json);

  @JsonKey()
  @override
  final String name;
  @override
  final String uuid;
  @override
  final String? imageUrl;
  @JsonKey()
  @override
  final int prepareTime;
  @JsonKey()
  @override
  final int hangingTime;
  @JsonKey()
  @override
  final int restingTime;
  @JsonKey()
  @override
  final int reps;
  @override
  final int? initialReps;
  @JsonKey()
  @override
  final int restAfterExercise;
  @override
  final ExerciseState exerciseState;
  @override
  final ExerciseType exerciseType;
  @JsonKey()
  @override
  final int estimatedTime;
  @JsonKey()
  @override
  final bool startAfterFinish;
  @JsonKey()
  @override
  final bool showDetails;

  @override
  String toString() {
    return 'Exercise(name: $name, uuid: $uuid, imageUrl: $imageUrl, prepareTime: $prepareTime, hangingTime: $hangingTime, restingTime: $restingTime, reps: $reps, initialReps: $initialReps, restAfterExercise: $restAfterExercise, exerciseState: $exerciseState, exerciseType: $exerciseType, estimatedTime: $estimatedTime, startAfterFinish: $startAfterFinish, showDetails: $showDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Exercise &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.prepareTime, prepareTime) &&
            const DeepCollectionEquality()
                .equals(other.hangingTime, hangingTime) &&
            const DeepCollectionEquality()
                .equals(other.restingTime, restingTime) &&
            const DeepCollectionEquality().equals(other.reps, reps) &&
            const DeepCollectionEquality()
                .equals(other.initialReps, initialReps) &&
            const DeepCollectionEquality()
                .equals(other.restAfterExercise, restAfterExercise) &&
            const DeepCollectionEquality()
                .equals(other.exerciseState, exerciseState) &&
            const DeepCollectionEquality()
                .equals(other.exerciseType, exerciseType) &&
            const DeepCollectionEquality()
                .equals(other.estimatedTime, estimatedTime) &&
            const DeepCollectionEquality()
                .equals(other.startAfterFinish, startAfterFinish) &&
            const DeepCollectionEquality()
                .equals(other.showDetails, showDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(prepareTime),
      const DeepCollectionEquality().hash(hangingTime),
      const DeepCollectionEquality().hash(restingTime),
      const DeepCollectionEquality().hash(reps),
      const DeepCollectionEquality().hash(initialReps),
      const DeepCollectionEquality().hash(restAfterExercise),
      const DeepCollectionEquality().hash(exerciseState),
      const DeepCollectionEquality().hash(exerciseType),
      const DeepCollectionEquality().hash(estimatedTime),
      const DeepCollectionEquality().hash(startAfterFinish),
      const DeepCollectionEquality().hash(showDetails));

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
      {String name,
      required String uuid,
      String? imageUrl,
      int prepareTime,
      int hangingTime,
      int restingTime,
      int reps,
      int? initialReps,
      int restAfterExercise,
      required ExerciseState exerciseState,
      required ExerciseType exerciseType,
      int estimatedTime,
      bool startAfterFinish,
      bool showDetails}) = _$_Exercise;
  const _Exercise._() : super._();

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  String? get imageUrl;
  @override
  int get prepareTime;
  @override
  int get hangingTime;
  @override
  int get restingTime;
  @override
  int get reps;
  @override
  int? get initialReps;
  @override
  int get restAfterExercise;
  @override
  ExerciseState get exerciseState;
  @override
  ExerciseType get exerciseType;
  @override
  int get estimatedTime;
  @override
  bool get startAfterFinish;
  @override
  bool get showDetails;
  @override
  @JsonKey(ignore: true)
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}
