import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositiries/sambased.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

final workoutDAOProvider = StateNotifierProvider<WorkoutDAONotifier, WorkoutDAO>((ref) {
  final db = ref.watch(sembastProvider);

  return WorkoutDAONotifier(db);
});

class WorkoutDAONotifier extends StateNotifier<WorkoutDAO> {
  WorkoutDAONotifier(db) : super(WorkoutDAO(db));
}

Uuid _uuid = const Uuid();

class WorkoutDAO {
  final SembastDatabase _db;
  final _store = intMapStoreFactory.store('workout');
  WorkoutDAO(
    this._db,
  );
  Future<void> saveWorkout(Workout workout) async {
    final newExercise = workout.copyWith(uuid: _uuid.v4());
    await _store.add(_db.instance, newExercise.toJson());
  }

  Stream<List<Workout>> getAllExercisesFromWorkout() {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    return _store
        .query(finder: _finder)
        .onSnapshots(_db.instance)
        .map((records) => records.map((snapshot) {
              final workout = Workout.fromJson(snapshot.value);
              return workout;
            }).toList());
  }

  Future<void> deleteWorkout(Workout workout) async {
    final finder = Finder(filter: Filter.equals('uuid', workout.uuid));
    await _store.delete(_db.instance, finder: finder);
  }

  Future<void> updateWorkout(Workout workout) async {
    final finder = Finder(filter: Filter.byKey(workout.uuid)); //old code
    await _store.update(_db.instance, workout.toJson(), finder: finder);
  }

  Future<void> onReorder(int oldIndex, int newIndex,) async {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    final recordSnapshot = await _store.find(_db.instance, finder: _finder);
    var listFromDatabase = recordSnapshot.map((snapshot) {
      final workout = Workout.fromJson(snapshot.value);
      return workout;
    }).toList();
    final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = listFromDatabase.removeAt(oldIndex);
    listFromDatabase.insert(newIdx, item);
    final listOfMaps = listFromDatabase.map((exercise) => exercise.toJson()).toList();
    await _store.delete(_db.instance);
    await _store.addAll(_db.instance, listOfMaps);
  }

}