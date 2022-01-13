import 'package:json_annotation/json_annotation.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';

part 'workout2_model.freezed.dart';
part 'workout2_model.g.dart';

@freezed
class Workout2 with _$Workout2 {
  const Workout2._();
  @JsonSerializable(explicitToJson: true)
  const factory Workout2({
    String? name,
    @Default([]) List<WorkoutItem> workoutItems,
    @Default(false) bool showDetails,
    required String uuid,
    String? description,
  }) = _Workout2;
  factory Workout2.fromJson(Map<String, dynamic> json) => _$Workout2FromJson(json);
}
