import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';

final workoutDummyList = [
  Workout(
    name: 'Devils Abbs',
    listOfExercises: [...exerciseDummyList],
    showDetails: false,
    workoutStep: 2,
    uuid: '',
    workoutState: WorkoutState.initial,
    timerDuration: 3,
  ),
  Workout(
    name: 'Yves Gravelle',
    listOfExercises: [...exerciseDummyList],
    showDetails: false,
    workoutStep: 4,
    uuid: '',
    workoutState: WorkoutState.initial,
    timerDuration: 6,
  ),
  Workout(
    name: 'Finger maniacs',
    listOfExercises: [...exerciseDummyList],
    showDetails: false,
    workoutStep: 5,
    uuid: '',
    workoutState: WorkoutState.initial,
    timerDuration: 7,
  )
];

final exerciseDummyList = <Exercise>[
  ExerciseRepeaters(
    uuid: '1aa',
    hangingTime: 10,
    restingTime: 5,
    reps: 3,
    estimatedTime: 35,
    startAfterFinish: true,
    showDetails: false,
  ),
  ExerciseFixedTime(
    estimatedTime: 30,
    uuid: '2aa',
  ),
  const ExerciseRest(
    uuid: '3aa',
    restTime: 30,
  ),
];
