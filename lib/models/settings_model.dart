import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  const Settings._();
  const factory Settings({
  @Default(true) bool displayDetails,
  }) = _Settings;
   factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
}