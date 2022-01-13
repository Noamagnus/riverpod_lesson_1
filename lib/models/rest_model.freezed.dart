// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rest _$RestFromJson(Map<String, dynamic> json) {
  return _Rest.fromJson(json);
}

/// @nodoc
class _$RestTearOff {
  const _$RestTearOff();

  _Rest call({required String uuid, required int restTime}) {
    return _Rest(
      uuid: uuid,
      restTime: restTime,
    );
  }

  Rest fromJson(Map<String, Object?> json) {
    return Rest.fromJson(json);
  }
}

/// @nodoc
const $Rest = _$RestTearOff();

/// @nodoc
mixin _$Rest {
  String get uuid => throw _privateConstructorUsedError;
  int get restTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestCopyWith<Rest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestCopyWith<$Res> {
  factory $RestCopyWith(Rest value, $Res Function(Rest) then) =
      _$RestCopyWithImpl<$Res>;
  $Res call({String uuid, int restTime});
}

/// @nodoc
class _$RestCopyWithImpl<$Res> implements $RestCopyWith<$Res> {
  _$RestCopyWithImpl(this._value, this._then);

  final Rest _value;
  // ignore: unused_field
  final $Res Function(Rest) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? restTime = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      restTime: restTime == freezed
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RestCopyWith<$Res> implements $RestCopyWith<$Res> {
  factory _$RestCopyWith(_Rest value, $Res Function(_Rest) then) =
      __$RestCopyWithImpl<$Res>;
  @override
  $Res call({String uuid, int restTime});
}

/// @nodoc
class __$RestCopyWithImpl<$Res> extends _$RestCopyWithImpl<$Res>
    implements _$RestCopyWith<$Res> {
  __$RestCopyWithImpl(_Rest _value, $Res Function(_Rest) _then)
      : super(_value, (v) => _then(v as _Rest));

  @override
  _Rest get _value => super._value as _Rest;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? restTime = freezed,
  }) {
    return _then(_Rest(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      restTime: restTime == freezed
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rest extends _Rest {
  const _$_Rest({required this.uuid, required this.restTime}) : super._();

  factory _$_Rest.fromJson(Map<String, dynamic> json) => _$$_RestFromJson(json);

  @override
  final String uuid;
  @override
  final int restTime;

  @override
  String toString() {
    return 'Rest(uuid: $uuid, restTime: $restTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Rest &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.restTime, restTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(restTime));

  @JsonKey(ignore: true)
  @override
  _$RestCopyWith<_Rest> get copyWith =>
      __$RestCopyWithImpl<_Rest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestToJson(this);
  }
}

abstract class _Rest extends Rest {
  const factory _Rest({required String uuid, required int restTime}) = _$_Rest;
  const _Rest._() : super._();

  factory _Rest.fromJson(Map<String, dynamic> json) = _$_Rest.fromJson;

  @override
  String get uuid;
  @override
  int get restTime;
  @override
  @JsonKey(ignore: true)
  _$RestCopyWith<_Rest> get copyWith => throw _privateConstructorUsedError;
}
