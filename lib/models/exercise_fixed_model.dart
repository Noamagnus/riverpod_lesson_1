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
    int? numberOfReps,
    String? imageUrl,
    String? props,
    @Default(true) bool displayDetails,
  }) = _BreakBetweenExercises;
  factory ExerciseFixed.fromJson(Map<String, dynamic> json) => _$ExerciseFixedFromJson(json);
}
