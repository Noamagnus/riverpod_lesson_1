import 'dart:io';

import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class Exercise with _$Exercise {
  const Exercise._();
  const factory Exercise({ 
    String? name,   
    required String uuid,
    required int hangingTime,
    required int restingTime,
    required int reps,
    required ExerciseState exerciseState,
    String? imageUrl,
    @Default(true) bool displayDetails,
  }) = _Exercise;
  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}

// class FileConverter implements JsonConverter{
//   @override
//   fromJson(json) {
//     // TODO: implement fromJson
//     throw UnimplementedError();
//   }

//   @override
//   toJson(object) {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
//  }


// class Exercise {
//   final String uuid;
//   final int hangingTime;
//   final int restingTime;
//   final int reps;
//   final ExerciseState exerciseState;


//   const Exercise({
//     required this.uuid,
//     required this.hangingTime,
//     required this.restingTime,
//     required this.reps,
//     required this.exerciseState,
//   });

//   Exercise copyWith({
//     String? uuid,
//     int? hangingTime,
//     int? restingTime,
//     int? reps,
//     ExerciseState? exerciseState,
//   }) {
//     return Exercise(
//       uuid: uuid ?? this.uuid,
//       hangingTime: hangingTime ?? this.hangingTime,
//       restingTime: restingTime ?? this.restingTime,
//       reps: reps ?? this.reps,
//       exerciseState: exerciseState ?? this.exerciseState,
//     );
//   }
// }
