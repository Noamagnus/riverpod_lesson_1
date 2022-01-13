// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutItem _$WorkoutItemFromJson(Map<String, dynamic> json) {
  return _WorkoutItem.fromJson(json);
}

/// @nodoc
class _$WorkoutItemTearOff {
  const _$WorkoutItemTearOff();

  _WorkoutItem call(
      {String? name,
      required String uuid,
      WorkoutItemState? workoutItemState,
      Rest? rest,
      ExerciseFixed? exerciseFixed,
      Exercise? exercise,
      bool showDetails = true}) {
    return _WorkoutItem(
      name: name,
      uuid: uuid,
      workoutItemState: workoutItemState,
      rest: rest,
      exerciseFixed: exerciseFixed,
      exercise: exercise,
      showDetails: showDetails,
    );
  }

  WorkoutItem fromJson(Map<String, Object?> json) {
    return WorkoutItem.fromJson(json);
  }
}

/// @nodoc
const $WorkoutItem = _$WorkoutItemTearOff();

/// @nodoc
mixin _$WorkoutItem {
  String? get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  WorkoutItemState? get workoutItemState => throw _privateConstructorUsedError;
  Rest? get rest => throw _privateConstructorUsedError;
  ExerciseFixed? get exerciseFixed => throw _privateConstructorUsedError;
  Exercise? get exercise => throw _privateConstructorUsedError;
  bool get showDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutItemCopyWith<WorkoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutItemCopyWith<$Res> {
  factory $WorkoutItemCopyWith(
          WorkoutItem value, $Res Function(WorkoutItem) then) =
      _$WorkoutItemCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String uuid,
      WorkoutItemState? workoutItemState,
      Rest? rest,
      ExerciseFixed? exerciseFixed,
      Exercise? exercise,
      bool showDetails});

  $RestCopyWith<$Res>? get rest;
  $ExerciseFixedCopyWith<$Res>? get exerciseFixed;
  $ExerciseCopyWith<$Res>? get exercise;
}

/// @nodoc
class _$WorkoutItemCopyWithImpl<$Res> implements $WorkoutItemCopyWith<$Res> {
  _$WorkoutItemCopyWithImpl(this._value, this._then);

  final WorkoutItem _value;
  // ignore: unused_field
  final $Res Function(WorkoutItem) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? workoutItemState = freezed,
    Object? rest = freezed,
    Object? exerciseFixed = freezed,
    Object? exercise = freezed,
    Object? showDetails = freezed,
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
      workoutItemState: workoutItemState == freezed
          ? _value.workoutItemState
          : workoutItemState // ignore: cast_nullable_to_non_nullable
              as WorkoutItemState?,
      rest: rest == freezed
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as Rest?,
      exerciseFixed: exerciseFixed == freezed
          ? _value.exerciseFixed
          : exerciseFixed // ignore: cast_nullable_to_non_nullable
              as ExerciseFixed?,
      exercise: exercise == freezed
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise?,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $RestCopyWith<$Res>? get rest {
    if (_value.rest == null) {
      return null;
    }

    return $RestCopyWith<$Res>(_value.rest!, (value) {
      return _then(_value.copyWith(rest: value));
    });
  }

  @override
  $ExerciseFixedCopyWith<$Res>? get exerciseFixed {
    if (_value.exerciseFixed == null) {
      return null;
    }

    return $ExerciseFixedCopyWith<$Res>(_value.exerciseFixed!, (value) {
      return _then(_value.copyWith(exerciseFixed: value));
    });
  }

  @override
  $ExerciseCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }
}

/// @nodoc
abstract class _$WorkoutItemCopyWith<$Res>
    implements $WorkoutItemCopyWith<$Res> {
  factory _$WorkoutItemCopyWith(
          _WorkoutItem value, $Res Function(_WorkoutItem) then) =
      __$WorkoutItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String uuid,
      WorkoutItemState? workoutItemState,
      Rest? rest,
      ExerciseFixed? exerciseFixed,
      Exercise? exercise,
      bool showDetails});

  @override
  $RestCopyWith<$Res>? get rest;
  @override
  $ExerciseFixedCopyWith<$Res>? get exerciseFixed;
  @override
  $ExerciseCopyWith<$Res>? get exercise;
}

/// @nodoc
class __$WorkoutItemCopyWithImpl<$Res> extends _$WorkoutItemCopyWithImpl<$Res>
    implements _$WorkoutItemCopyWith<$Res> {
  __$WorkoutItemCopyWithImpl(
      _WorkoutItem _value, $Res Function(_WorkoutItem) _then)
      : super(_value, (v) => _then(v as _WorkoutItem));

  @override
  _WorkoutItem get _value => super._value as _WorkoutItem;

  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? workoutItemState = freezed,
    Object? rest = freezed,
    Object? exerciseFixed = freezed,
    Object? exercise = freezed,
    Object? showDetails = freezed,
  }) {
    return _then(_WorkoutItem(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      workoutItemState: workoutItemState == freezed
          ? _value.workoutItemState
          : workoutItemState // ignore: cast_nullable_to_non_nullable
              as WorkoutItemState?,
      rest: rest == freezed
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as Rest?,
      exerciseFixed: exerciseFixed == freezed
          ? _value.exerciseFixed
          : exerciseFixed // ignore: cast_nullable_to_non_nullable
              as ExerciseFixed?,
      exercise: exercise == freezed
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise?,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorkoutItem extends _WorkoutItem {
  const _$_WorkoutItem(
      {this.name,
      required this.uuid,
      this.workoutItemState,
      this.rest,
      this.exerciseFixed,
      this.exercise,
      this.showDetails = true})
      : super._();

  factory _$_WorkoutItem.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutItemFromJson(json);

  @override
  final String? name;
  @override
  final String uuid;
  @override
  final WorkoutItemState? workoutItemState;
  @override
  final Rest? rest;
  @override
  final ExerciseFixed? exerciseFixed;
  @override
  final Exercise? exercise;
  @JsonKey()
  @override
  final bool showDetails;

  @override
  String toString() {
    return 'WorkoutItem(name: $name, uuid: $uuid, workoutItemState: $workoutItemState, rest: $rest, exerciseFixed: $exerciseFixed, exercise: $exercise, showDetails: $showDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutItem &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality()
                .equals(other.workoutItemState, workoutItemState) &&
            const DeepCollectionEquality().equals(other.rest, rest) &&
            const DeepCollectionEquality()
                .equals(other.exerciseFixed, exerciseFixed) &&
            const DeepCollectionEquality().equals(other.exercise, exercise) &&
            const DeepCollectionEquality()
                .equals(other.showDetails, showDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(workoutItemState),
      const DeepCollectionEquality().hash(rest),
      const DeepCollectionEquality().hash(exerciseFixed),
      const DeepCollectionEquality().hash(exercise),
      const DeepCollectionEquality().hash(showDetails));

  @JsonKey(ignore: true)
  @override
  _$WorkoutItemCopyWith<_WorkoutItem> get copyWith =>
      __$WorkoutItemCopyWithImpl<_WorkoutItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutItemToJson(this);
  }
}

abstract class _WorkoutItem extends WorkoutItem {
  const factory _WorkoutItem(
      {String? name,
      required String uuid,
      WorkoutItemState? workoutItemState,
      Rest? rest,
      ExerciseFixed? exerciseFixed,
      Exercise? exercise,
      bool showDetails}) = _$_WorkoutItem;
  const _WorkoutItem._() : super._();

  factory _WorkoutItem.fromJson(Map<String, dynamic> json) =
      _$_WorkoutItem.fromJson;

  @override
  String? get name;
  @override
  String get uuid;
  @override
  WorkoutItemState? get workoutItemState;
  @override
  Rest? get rest;
  @override
  ExerciseFixed? get exerciseFixed;
  @override
  Exercise? get exercise;
  @override
  bool get showDetails;
  @override
  @JsonKey(ignore: true)
  _$WorkoutItemCopyWith<_WorkoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}
