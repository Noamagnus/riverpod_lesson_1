import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/repositories/exerciseDAO.dart';
import 'package:my_first_riverpod/repositories/sambased.dart';
import 'package:rxdart/subjects.dart';

class ExerciseRepo {
  // ExerciseRepo({});
  // final SembastDatabase _sembastDatabase;
  final List<Exercise> _exerciseList = [];
  final exerciseListDAO = ExerciseDAO(SembastDatabase());
  final ReplaySubject<List<Exercise>> _exerciseController = ReplaySubject<List<Exercise>>();
  get exerciseListStream => _exerciseController.stream;

  Future<void> getExercises() async {
    // Fetch exercises from the database
    exerciseListDAO.getExerciseListFromDB().listen((exercises) {
      _exerciseList.clear();
      _exerciseList.addAll(exercises);
      _exerciseController.add(_exerciseList);
    });
  }

  Future<void> addExercise(Exercise exercise) async {
    // Add exercise to the memory
    _exerciseList.add(exercise);
    final newList = [..._exerciseList];
    _exerciseController.add(newList);
  }

  Future<void> updateExercise(Exercise exercise) async {
    // Update exercise on the server
  }
  Future<void> deleteExercise(Exercise exercise) async {
    _exerciseList.retainWhere((element) => element.uuid != exercise.uuid);
    final newList = [..._exerciseList];
    _exerciseController.add(newList);
  }
}