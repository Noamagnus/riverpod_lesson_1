import 'package:freezed_annotation/freezed_annotation.dart';
part 'exercise_fixed_model.g.dart';
part 'exercise_fixed_model.freezed.dart';

@freezed
class ExerciseFixed with _$ExerciseFixed {
  const ExerciseFixed._();
  const factory ExerciseFixed({
    String? name,
    required int estimatedTime,
    @Default(false) bool continueOnFinish,
    int? reps,
    String? imageUrl,
    String? props,
    @Default(ExerciseFixedState.stop)ExerciseFixedState exerciseFixedState,
    @Default(true) bool displayDetails,
  }) = _ExerciseFixed;
  factory ExerciseFixed.fromJson(Map<String, dynamic> json) => _$ExerciseFixedFromJson(json);
}

enum ExerciseFixedState{keepRunning, stop}
