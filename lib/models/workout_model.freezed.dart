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
      List<WorkoutItem> workoutItems = const [],
      bool showDetails = false,
      int workoutStep = 0,
      required String uuid,
      String? description,
      WorkoutState workoutState = WorkoutState.initial,
      int timerDuration = 0}) {
    return _Workout(
      name: name,
      workoutItems: workoutItems,
      showDetails: showDetails,
      workoutStep: workoutStep,
      uuid: uuid,
      description: description,
      workoutState: workoutState,
      timerDuration: timerDuration,
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
  List<WorkoutItem> get workoutItems => throw _privateConstructorUsedError;
  bool get showDetails => throw _privateConstructorUsedError;
  int get workoutStep => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  WorkoutState get workoutState => throw _privateConstructorUsedError;
  int get timerDuration => throw _privateConstructorUsedError;

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
      List<WorkoutItem> workoutItems,
      bool showDetails,
      int workoutStep,
      String uuid,
      String? description,
      WorkoutState workoutState,
      int timerDuration});
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
    Object? workoutItems = freezed,
    Object? showDetails = freezed,
    Object? workoutStep = freezed,
    Object? uuid = freezed,
    Object? description = freezed,
    Object? workoutState = freezed,
    Object? timerDuration = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutItems: workoutItems == freezed
          ? _value.workoutItems
          : workoutItems // ignore: cast_nullable_to_non_nullable
              as List<WorkoutItem>,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      workoutStep: workoutStep == freezed
          ? _value.workoutStep
          : workoutStep // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutState: workoutState == freezed
          ? _value.workoutState
          : workoutState // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      timerDuration: timerDuration == freezed
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
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
      List<WorkoutItem> workoutItems,
      bool showDetails,
      int workoutStep,
      String uuid,
      String? description,
      WorkoutState workoutState,
      int timerDuration});
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
    Object? workoutItems = freezed,
    Object? showDetails = freezed,
    Object? workoutStep = freezed,
    Object? uuid = freezed,
    Object? description = freezed,
    Object? workoutState = freezed,
    Object? timerDuration = freezed,
  }) {
    return _then(_Workout(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutItems: workoutItems == freezed
          ? _value.workoutItems
          : workoutItems // ignore: cast_nullable_to_non_nullable
              as List<WorkoutItem>,
      showDetails: showDetails == freezed
          ? _value.showDetails
          : showDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      workoutStep: workoutStep == freezed
          ? _value.workoutStep
          : workoutStep // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutState: workoutState == freezed
          ? _value.workoutState
          : workoutState // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      timerDuration: timerDuration == freezed
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Workout extends _Workout {
  const _$_Workout(
      {this.name,
      this.workoutItems = const [],
      this.showDetails = false,
      this.workoutStep = 0,
      required this.uuid,
      this.description,
      this.workoutState = WorkoutState.initial,
      this.timerDuration = 0})
      : super._();

  factory _$_Workout.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutFromJson(json);

  @override
  final String? name;
  @JsonKey()
  @override
  final List<WorkoutItem> workoutItems;
  @JsonKey()
  @override
  final bool showDetails;
  @JsonKey()
  @override
  final int workoutStep;
  @override
  final String uuid;
  @override
  final String? description;
  @JsonKey()
  @override
  final WorkoutState workoutState;
  @JsonKey()
  @override
  final int timerDuration;

  @override
  String toString() {
    return 'Workout(name: $name, workoutItems: $workoutItems, showDetails: $showDetails, workoutStep: $workoutStep, uuid: $uuid, description: $description, workoutState: $workoutState, timerDuration: $timerDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Workout &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.workoutItems, workoutItems) &&
            const DeepCollectionEquality()
                .equals(other.showDetails, showDetails) &&
            const DeepCollectionEquality()
                .equals(other.workoutStep, workoutStep) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.workoutState, workoutState) &&
            const DeepCollectionEquality()
                .equals(other.timerDuration, timerDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(workoutItems),
      const DeepCollectionEquality().hash(showDetails),
      const DeepCollectionEquality().hash(workoutStep),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(workoutState),
      const DeepCollectionEquality().hash(timerDuration));

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
      List<WorkoutItem> workoutItems,
      bool showDetails,
      int workoutStep,
      required String uuid,
      String? description,
      WorkoutState workoutState,
      int timerDuration}) = _$_Workout;
  const _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$_Workout.fromJson;

  @override
  String? get name;
  @override
  List<WorkoutItem> get workoutItems;
  @override
  bool get showDetails;
  @override
  int get workoutStep;
  @override
  String get uuid;
  @override
  String? get description;
  @override
  WorkoutState get workoutState;
  @override
  int get timerDuration;
  @override
  @JsonKey(ignore: true)
  _$WorkoutCopyWith<_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}
