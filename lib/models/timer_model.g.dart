// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerModel _$$_TimerModelFromJson(Map<String, dynamic> json) =>
    _$_TimerModel(
      timeToCount: json['timeToCount'] as int,
      timeLeft: json['timeLeft'] as String?,
      timerState: $enumDecode(_$TimerStateEnumMap, json['timerState']),
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$$_TimerModelToJson(_$_TimerModel instance) =>
    <String, dynamic>{
      'timeToCount': instance.timeToCount,
      'timeLeft': instance.timeLeft,
      'timerState': _$TimerStateEnumMap[instance.timerState],
      'duration': instance.duration,
    };

const _$TimerStateEnumMap = {
  TimerState.initial: 'initial',
  TimerState.started: 'started',
  TimerState.paused: 'paused',
  TimerState.finished: 'finished',
};
