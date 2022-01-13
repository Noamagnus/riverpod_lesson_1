// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout2_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workout2 _$Workout2FromJson(Map<String, dynamic> json) {
  return _Workout2.fromJson(json);
}

/// @nodoc
class _$Workout2TearOff {
  const _$Workout2TearOff();

  _Workout2 call(
      {String? name,
      List<WorkoutItem> workoutItems = const [],
      bool showDetails = false,
      required String uuid,
      String? description}) {
    return _Workout2(
      name: name,
      workoutItems: workoutItems,
      showDetails: showDetails,
      uuid: uuid,
      description: description,
    );
  }

  Workout2 fromJson(Map<String, Object?> json) {
    return Workout2.fromJson(json);
  }
}

/// @nodoc
const $Workout2 = _$Workout2TearOff();

/// @nodoc
mixin _$Workout2 {
  String? get name => throw _privateConstructorUsedError;
  List<WorkoutItem> get workoutItems => throw _privateConstructorUsedError;
  bool get showDetails => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Workout2CopyWith<Workout2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Workout2CopyWith<$Res> {
  factory $Workout2CopyWith(Workout2 value, $Res Function(Workout2) then) =
      _$Workout2CopyWithImpl<$Res>;
  $Res call(
      {String? name,
      List<WorkoutItem> workoutItems,
      bool showDetails,
      String uuid,
      String? description});
}

/// @nodoc
class _$Workout2CopyWithImpl<$Res> implements $Workout2CopyWith<$Res> {
  _$Workout2CopyWithImpl(this._value, this._then);

  final Workout2 _value;
  // ignore: unused_field
  final $Res Function(Workout2) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? workoutItems = freezed,
    Object? showDetails = freezed,
    Object? uuid = freezed,
    Object? description = freezed,
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
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$Workout2CopyWith<$Res> implements $Workout2CopyWith<$Res> {
  factory _$Workout2CopyWith(_Workout2 value, $Res Function(_Workout2) then) =
      __$Workout2CopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      List<WorkoutItem> workoutItems,
      bool showDetails,
      String uuid,
      String? description});
}

/// @nodoc
class __$Workout2CopyWithImpl<$Res> extends _$Workout2CopyWithImpl<$Res>
    implements _$Workout2CopyWith<$Res> {
  __$Workout2CopyWithImpl(_Workout2 _value, $Res Function(_Workout2) _then)
      : super(_value, (v) => _then(v as _Workout2));

  @override
  _Workout2 get _value => super._value as _Workout2;

  @override
  $Res call({
    Object? name = freezed,
    Object? workoutItems = freezed,
    Object? showDetails = freezed,
    Object? uuid = freezed,
    Object? description = freezed,
  }) {
    return _then(_Workout2(
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
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Workout2 extends _Workout2 {
  const _$_Workout2(
      {this.name,
      this.workoutItems = const [],
      this.showDetails = false,
      required this.uuid,
      this.description})
      : super._();

  factory _$_Workout2.fromJson(Map<String, dynamic> json) =>
      _$$_Workout2FromJson(json);

  @override
  final String? name;
  @JsonKey()
  @override
  final List<WorkoutItem> workoutItems;
  @JsonKey()
  @override
  final bool showDetails;
  @override
  final String uuid;
  @override
  final String? description;

  @override
  String toString() {
    return 'Workout2(name: $name, workoutItems: $workoutItems, showDetails: $showDetails, uuid: $uuid, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Workout2 &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.workoutItems, workoutItems) &&
            const DeepCollectionEquality()
                .equals(other.showDetails, showDetails) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(workoutItems),
      const DeepCollectionEquality().hash(showDetails),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$Workout2CopyWith<_Workout2> get copyWith =>
      __$Workout2CopyWithImpl<_Workout2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Workout2ToJson(this);
  }
}

abstract class _Workout2 extends Workout2 {
  const factory _Workout2(
      {String? name,
      List<WorkoutItem> workoutItems,
      bool showDetails,
      required String uuid,
      String? description}) = _$_Workout2;
  const _Workout2._() : super._();

  factory _Workout2.fromJson(Map<String, dynamic> json) = _$_Workout2.fromJson;

  @override
  String? get name;
  @override
  List<WorkoutItem> get workoutItems;
  @override
  bool get showDetails;
  @override
  String get uuid;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$Workout2CopyWith<_Workout2> get copyWith =>
      throw _privateConstructorUsedError;
}
