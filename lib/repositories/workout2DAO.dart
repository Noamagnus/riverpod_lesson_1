import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositories/sambased.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

final workout2DAOProvider = StateNotifierProvider<Workout2DAONotifier, Workout2DAO>((ref) {
  final db = ref.watch(sembastProvider);

  return Workout2DAONotifier(db);
});

class Workout2DAONotifier extends StateNotifier<Workout2DAO> {
  Workout2DAONotifier(db) : super(Workout2DAO(db));
}

Uuid _uuid = const Uuid();

class Workout2DAO {
  final SembastDatabase _db;
  final _store = intMapStoreFactory.store('workout2');
  Workout2DAO(
    this._db,
  );
  Future<void> saveWorkout(Workout workout) async {
    final newWorkout = workout.copyWith(uuid: _uuid.v4());
    await _store.add(_db.instance, newWorkout.toMap());
  }

  Stream<List<Workout>> getAllWorkouts() {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    return _store
        .query(finder: _finder)
        .onSnapshots(_db.instance)
        .map((records) => records.map((snapshot) {
              final workout = Workout.fromMap(snapshot.value);
              return workout;
            }).toList());
  }


  Future<void> deleteWorkout(Workout workout) async {
    final finder = Finder(filter: Filter.equals('uuid', workout.uuid));
    await _store.delete(_db.instance, finder: finder);
  }

  Future<void> updateWorkout(Workout workout) async {
    final finder = Finder(filter: Filter.byKey(workout.uuid)); //old code
    await _store.update(_db.instance, workout.toMap(), finder: finder);
  }
  //!Not sure if this is right
  Future<void> getWorkout(Workout workout) async {
    final finder = Finder(filter: Filter.byKey(workout.uuid)); //old code
    var records = await _store.findFirst(_db.instance, finder: finder);

  }

  Future<void> toggleDetails(Workout workout) async {
    final finder = Finder(filter: Filter.equals('uuid', workout.uuid));
    final newWorkout = workout.copyWith(showDetails: !workout.showDetails);
    await _store.update(_db.instance, newWorkout.toMap(), finder: finder);
  }

  Future<void> onReorder(
    int oldIndex,
    int newIndex,
  ) async {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    final recordSnapshot = await _store.find(_db.instance, finder: _finder);
    var listFromDatabase = recordSnapshot.map((snapshot) {
      final workout = Workout.fromMap(snapshot.value);
      return workout;
    }).toList();
    final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = listFromDatabase.removeAt(oldIndex);
    listFromDatabase.insert(newIdx, item);
    final listOfMaps = listFromDatabase.map((exercise) => exercise.toMap()).toList();
    await _store.delete(_db.instance);
    await _store.addAll(_db.instance, listOfMaps);
  }
}
