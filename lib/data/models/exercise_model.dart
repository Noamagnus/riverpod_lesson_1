import 'dart:core';

import 'package:equatable/equatable.dart';

abstract class Exercise extends Equatable {
  final String? name;
  final String uuid;
  final ExerciseTypeNew exerciseType;

  const Exercise({
    this.name,
    required this.uuid,
    required this.exerciseType,
  });
}

class ExerciseRepeaters extends Exercise {
  final int hangingTime;
  final int restingTime;
  final int reps;
  final int? estimatedTime;
  final bool startAfterFinish;
  final bool showDetails;

  const ExerciseRepeaters({
    super.name,
    required super.uuid,
    super.exerciseType = ExerciseTypeNew.repeaters,
    required this.hangingTime,
    required this.restingTime,
    required this.reps,
    required this.estimatedTime,
    required this.startAfterFinish,
    required this.showDetails,
  });

  const ExerciseRepeaters.initial({
    super.name = 'balsls',
    super.uuid = '1',
    super.exerciseType = ExerciseTypeNew.repeaters,
    this.hangingTime = 10,
    this.restingTime = 5,
    this.reps = 3,
    this.estimatedTime = 35,
    this.startAfterFinish = true,
    this.showDetails = false,
  });

  @override
  List<Object?> get props => [
        name,
        uuid,
        hangingTime,
        restingTime,
        exerciseType,
        estimatedTime,
        startAfterFinish,
        showDetails,
      ];

  ExerciseRepeaters copyWith({
    int? hangingTime,
    int? restingTime,
    int? reps,
    int? estimatedTime,
    bool? startAfterFinish,
    bool? showDetails,
    String? uuid,
  }) {
    return ExerciseRepeaters(
      hangingTime: hangingTime ?? this.hangingTime,
      restingTime: restingTime ?? this.restingTime,
      reps: reps ?? this.reps,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      startAfterFinish: startAfterFinish ?? this.startAfterFinish,
      showDetails: showDetails ?? this.showDetails,
      uuid: uuid ?? super.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hangingTime': this.hangingTime,
      'restingTime': this.restingTime,
      'sets': this.reps,
      'estimatedTime': this.estimatedTime,
      'startAfterFinish': this.startAfterFinish,
      'showDetails': this.showDetails,
      'uuid': super.uuid,
    };
  }

  factory ExerciseRepeaters.fromMap(Map<String, dynamic> map) {
    return ExerciseRepeaters(
      hangingTime: map['hangingTime'] as int,
      restingTime: map['restingTime'] as int,
      reps: map['sets'] as int,
      estimatedTime: map['estimatedTime'] as int,
      startAfterFinish: map['startAfterFinish'] as bool,
      showDetails: map['showDetails'] as bool,
      uuid: map['uuid'] as String,
    );
  }
}

class ExerciseFixedTime extends Exercise {
  final int estimatedTime;

  const ExerciseFixedTime({
    required this.estimatedTime,
    required super.uuid,
    super.exerciseType = ExerciseTypeNew.fixedTime,
  });

  @override
  List<Object?> get props => [
        name,
        uuid,
        exerciseType,
        estimatedTime,
      ];
}

class ExerciseRest extends Exercise {
  final int restTime;

  const ExerciseRest({
    required this.restTime,
    required super.uuid,
    super.exerciseType = ExerciseTypeNew.rest,
  });

  const ExerciseRest.initial({
    this.restTime = 0,
    super.uuid = '',
    super.exerciseType = ExerciseTypeNew.rest,
  });

  @override
  List<Object?> get props => [
        name,
        uuid,
        exerciseType,
        restTime,
      ];

  ExerciseRest copyWith({
    int? restTime,
  }) {
    return ExerciseRest(
      restTime: restTime ?? this.restTime,
      uuid: super.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'restTime': this.restTime,
      'uuid': super.uuid,
    };
  }

  factory ExerciseRest.fromMap(Map<String, dynamic> map) {
    return ExerciseRest(
      restTime: map['restTime'] as int,
      uuid: map['uuid'] as String,
    );
  }
}

// class Exercise extends Equatable {
//   final String? name;
//   final String uuid;
//   final String? imageUrl;
//   final int? prepareTime;
//   final int? hangingTime;
//   final int? restingTime;
//   final int? reps;
//   final int? initialReps;
//   final int? restAfterExercise;
//   final ExerciseState exerciseState;
//   final ExerciseType exerciseType;
//   final int? estimatedTime;
//   final bool startAfterFinish;
//   final bool showDetails;
//
//   const Exercise.initial()
//       : name = '',
//         uuid = '',
//         imageUrl = '',
//         prepareTime = 2,
//         hangingTime = 2,
//         restingTime = 2,
//         reps = 0,
//         initialReps = 0,
//         exerciseState = ExerciseState.initial,
//         exerciseType = ExerciseType.repeaters,
//         estimatedTime = 0,
//         startAfterFinish = false,
//         restAfterExercise = 2,
//         showDetails = false;
//
//   @override
//   List<Object?> get props => [
//         name,
//         uuid,
//         imageUrl,
//         prepareTime,
//         hangingTime,
//         restingTime,
//         reps,
//         initialReps,
//         exerciseState,
//         exerciseType,
//         estimatedTime,
//         startAfterFinish,
//         showDetails,
//       ];
//
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'uuid': uuid,
//       'imageUrl': imageUrl,
//       'prepareTime': prepareTime,
//       'hangingTime': hangingTime,
//       'restingTime': restingTime,
//       'reps': reps,
//       'initialReps': initialReps,
//       'exerciseState': exerciseState,
//       'exerciseType': exerciseType,
//       'estimatedTime': estimatedTime,
//       'startAfterFinish': startAfterFinish,
//       'showDetails': showDetails,
//     };
//   }
//
//   factory Exercise.fromMap(Map<String, dynamic> map) {
//     return Exercise(
//       name: map['name'] as String,
//       uuid: map['uuid'] as String,
//       imageUrl: map['imageUrl'] as String,
//       prepareTime: map['prepareTime'] as int,
//       hangingTime: map['hangingTime'] as int,
//       restingTime: map['restingTime'] as int,
//       reps: map['reps'] as int,
//       initialReps: map['initialReps'] as int,
//       restAfterExercise: map['restAfterExercise'] as int,
//       exerciseState: map['exerciseState'] as ExerciseState,
//       exerciseType: map['exerciseType'] as ExerciseType,
//       estimatedTime: map['estimatedTime'] as int,
//       startAfterFinish: map['startAfterFinish'] as bool,
//       showDetails: map['showDetails'] as bool,
//     );
//   }
//
//   Exercise copyWith({
//     String? name,
//     String? uuid,
//     String? imageUrl,
//     int? prepareTime,
//     int? hangingTime,
//     int? restingTime,
//     int? reps,
//     int? initialReps,
//     int? restAfterExercise,
//     ExerciseState? exerciseState,
//     ExerciseType? exerciseType,
//     int? estimatedTime,
//     bool? startAfterFinish,
//     bool? showDetails,
//   }) {
//     return Exercise(
//       name: name ?? this.name,
//       uuid: uuid ?? this.uuid,
//       imageUrl: imageUrl ?? this.imageUrl,
//       prepareTime: prepareTime ?? this.prepareTime,
//       hangingTime: hangingTime ?? this.hangingTime,
//       restingTime: restingTime ?? this.restingTime,
//       reps: reps ?? this.reps,
//       initialReps: initialReps ?? this.initialReps,
//       restAfterExercise: restAfterExercise ?? this.restAfterExercise,
//       exerciseState: exerciseState ?? this.exerciseState,
//       exerciseType: exerciseType ?? this.exerciseType,
//       estimatedTime: estimatedTime ?? this.estimatedTime,
//       startAfterFinish: startAfterFinish ?? this.startAfterFinish,
//       showDetails: showDetails ?? this.showDetails,
//     );
//   }
//
//   const Exercise({
//     this.name,
//     required this.uuid,
//     this.imageUrl,
//     this.prepareTime,
//     this.hangingTime,
//     this.restingTime,
//     this.reps,
//     this.initialReps,
//     this.restAfterExercise,
//     required this.exerciseState,
//     required this.exerciseType,
//     this.estimatedTime,
//     required this.startAfterFinish,
//     required this.showDetails,
//   });
// }

enum ExerciseState {
  initial,
  hanging,
  resting,
  paused,
  finished,
}

enum ExerciseType {
  repeaters,
  tabata,
  rest,
  fixedTime,
  campus,
  system,
  boulder,
  fingerboard,
}

enum ExerciseTypeNew {
  repeaters('Repeaters'),
  fixedTime('Fixed Time'),
  rest('Rest');

  const ExerciseTypeNew(this.name);

  final String name;
}
