import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_riverpod/models/exercise_fixed_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/rest_model.dart';
part 'workout_item_model.freezed.dart';
part 'workout_item_model.g.dart';

@freezed
class WorkoutItem with _$WorkoutItem {
  const WorkoutItem._();
  @JsonSerializable(explicitToJson: true)
  const factory WorkoutItem({
    String? name,
    required String uuid,
    WorkoutItemState? workoutItemState,
    Rest? rest,
    ExerciseFixed? exerciseFixed,
    Exercise? exercise,
    @Default(true) bool showDetails,
  }) = _WorkoutItem;
  factory WorkoutItem.fromJson(Map<String, dynamic> json) => _$WorkoutItemFromJson(json);
}

enum WorkoutItemState {rest,exerciseFixed,exercise}