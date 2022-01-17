import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositiries/sambased.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

final workoutItemDAOProvider = StateNotifierProvider<WorkoutDAONotifier, WorkoutItemDAO>((ref) {
  final db = ref.watch(sembastProvider);

  return WorkoutDAONotifier(db);
});

class WorkoutDAONotifier extends StateNotifier<WorkoutItemDAO> {
  WorkoutDAONotifier(db) : super(WorkoutItemDAO(db));
}

Uuid _uuid = const Uuid();

class WorkoutItemDAO {
  final SembastDatabase _db;
  final _store = intMapStoreFactory.store('workoutitem');
  WorkoutItemDAO(
    this._db,
  );
  Future<void> saveWorkoutItem(WorkoutItem workout) async {
    final newWorkout = workout.copyWith(uuid: _uuid.v4());
    await _store.add(_db.instance, newWorkout.toJson());
  }

  Stream<List<WorkoutItem>> getAllWorkoutsItems() {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    return _store
        .query(finder: _finder)
        .onSnapshots(_db.instance)
        .map((records) => records.map((snapshot) {
              final workoutItem = WorkoutItem.fromJson(snapshot.value);
              return workoutItem;
            }).toList());
  }


  Future<void> deleteWorkoutItem(WorkoutItem workoutItem) async {
    final finder = Finder(filter: Filter.equals('uuid', workoutItem.uuid));
    await _store.delete(_db.instance, finder: finder);
  }

  Future<void> updateWorkoutItem(WorkoutItem workoutItem) async {
    final finder = Finder(filter: Filter.byKey(workoutItem.uuid)); //old code
    await _store.update(_db.instance, workoutItem.toJson(), finder: finder);
  }
  //!Not sure if this is right
  Future<void> getWorkoutItem(WorkoutItem workoutItem) async {
    final finder = Finder(filter: Filter.byKey(workoutItem.uuid)); //old code
    var records = await _store.findFirst(_db.instance, finder: finder);

  }

  Future<void> toggleDetails(WorkoutItem workoutItem) async {
    final finder = Finder(filter: Filter.equals('uuid', workoutItem.uuid));
    final newWorkout = workoutItem.copyWith(showDetails: !workoutItem.showDetails);
    await _store.update(_db.instance, newWorkout.toJson(), finder: finder);
  }

  Future<void> onReorder(
    int oldIndex,
    int newIndex,
  ) async {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    final recordSnapshot = await _store.find(_db.instance, finder: _finder);
    var listFromDatabase = recordSnapshot.map((snapshot) {
      final workout = WorkoutItem.fromJson(snapshot.value);
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
