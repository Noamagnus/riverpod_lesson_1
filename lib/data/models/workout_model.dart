import 'package:equatable/equatable.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';

class Workout extends Equatable {
  final String? name;
  final List<Exercise> listOfExercises;
  final bool showDetails;
  final int workoutStep;
  final String uuid;
  final String? description;
  final WorkoutState workoutState;
  final int timerDuration;

  const Workout({
    this.name,
    required this.listOfExercises,
    required this.showDetails,
    required this.workoutStep,
    required this.uuid,
    this.description,
    required this.workoutState,
    required this.timerDuration,
  });

  const Workout.initial({
    this.name,
    this.listOfExercises = const [],
    this.showDetails = false,
    this.workoutStep = 0,
    this.uuid = '',
    this.description,
    this.workoutState = WorkoutState.initial,
    this.timerDuration = 0,
  });

  @override
  List<Object?> get props => [
        name,
        listOfExercises,
        showDetails,
        workoutStep,
        uuid,
        description,
        workoutState,
        timerDuration,
      ];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'listOfExercises': listOfExercises,
      'showDetails': showDetails,
      'workoutStep': workoutStep,
      'uuid': uuid,
      'description': description,
      'workoutState': workoutState,
      'timerDuration': timerDuration,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      name: map['name'] as String,
      listOfExercises: map['listOfExercises'] as List<Exercise>,
      showDetails: map['showDetails'] as bool,
      workoutStep: map['workoutStep'] as int,
      uuid: map['uuid'] as String,
      description: map['description'] as String,
      workoutState: map['workoutState'] as WorkoutState,
      timerDuration: map['timerDuration'] as int,
    );
  }

  Workout copyWith({
    String? name,
    List<Exercise>? listOfExercises,
    bool? showDetails,
    int? workoutStep,
    String? uuid,
    String? description,
    WorkoutState? workoutState,
    int? timerDuration,
  }) {
    return Workout(
      name: name ?? this.name,
      listOfExercises: listOfExercises ?? this.listOfExercises,
      showDetails: showDetails ?? this.showDetails,
      workoutStep: workoutStep ?? this.workoutStep,
      uuid: uuid ?? this.uuid,
      description: description ?? this.description,
      workoutState: workoutState ?? this.workoutState,
      timerDuration: timerDuration ?? this.timerDuration,
    );
  }
}

enum WorkoutState {
  initial,
  running,
  paused,
  finished,
  pausedAfterExerciseFixed,
}
