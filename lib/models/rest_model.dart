import 'package:freezed_annotation/freezed_annotation.dart';
part 'rest_model.freezed.dart';
part 'rest_model.g.dart';

@freezed
class Rest with _$Rest {
  const Rest._();
  const factory Rest({
    required String uuid,
    required int restTime,
  }) = _Rest;
  factory Rest.fromJson(Map<String, dynamic> json) => _$RestFromJson(json);
}