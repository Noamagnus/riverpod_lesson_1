import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositiries/sambased.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

final exerciseDAOProvider = StateNotifierProvider<ExerciseDAONotifier, ExerciseDAO>((ref) {
  final db = ref.watch(sembastProvider);

  return ExerciseDAONotifier(db);
});

class ExerciseDAONotifier extends StateNotifier<ExerciseDAO> {
  ExerciseDAONotifier(db) : super(ExerciseDAO(db));
}

Uuid _uuid = const Uuid();

class ExerciseDAO {
  final SembastDatabase _db;
  final _store = intMapStoreFactory.store('exercise1');
  ExerciseDAO(
    this._db,
  );
  Future<void> saveExercise(Exercise exercise) async {
    final newExercise = exercise.copyWith(uuid: _uuid.v4());
    await _store.add(_db.instance, newExercise.toJson());
  }

  Stream<List<Exercise>> getAllExercises2() {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    return _store
        .query(finder: _finder)
        .onSnapshots(_db.instance)
        .map((records) => records.map((snapshot) {
              final exercise = Exercise.fromJson(snapshot.value);
              return exercise;
            }).toList());
  }

  Future<void> deleteExercise(Exercise exercise) async {
    print('deleteExercise fired');
    final finder = Finder(filter: Filter.equals('uuid', exercise.uuid));
    await _store.delete(_db.instance, finder: finder);
  }

  Future<void> updateExercise(Exercise exercise) async {
    final finder = Finder(filter: Filter.byKey(exercise.uuid)); //old code
    await _store.update(_db.instance, exercise.toJson(), finder: finder);
  }

  Future<void> onReorder(int oldIndex, int newIndex,) async {
    var _finder = Finder(sortOrders: [SortOrder(Field.key)]);
    final recordSnapshot = await _store.find(_db.instance, finder: _finder);
// Getting list from database
// This list should have the same index as the one from ReordableListView because
// its sorted by keys in ascending orders
    var listFromDatabase = recordSnapshot.map((snapshot) {
      final exercise = Exercise.fromJson(snapshot.value);
      return exercise;
    }).toList();
    final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = listFromDatabase.removeAt(oldIndex);
    listFromDatabase.insert(newIdx, item);
    final listOfMaps = listFromDatabase.map((exercise) => exercise.toJson()).toList();
    // Now deleting previous records and adding reordered
    await _store.delete(_db.instance);
    await _store.addAll(_db.instance, listOfMaps);
  }

  Future<void> onReorder4(int oldIndex, int newIndex, List<Exercise> exerciseList) async {
    final oldExercise = exerciseList[0];
    final newExercise = exerciseList[1];
    final finder1 = Finder(filter: Filter.equals('uuid', oldExercise.uuid));
    final finder2 = Finder(filter: Filter.equals('uuid', newExercise.uuid));

    var record1 = await _store.findFirst(_db.instance, finder: finder1);
    var record2 = await _store.findFirst(_db.instance, finder: finder2);

    var newList = (await _store.find(_db.instance)).map((snapshot) {});
    print('Old key is ${record1?.key}');
    print('New key is ${record2?.key}');

    if (record1 != null && record2 != null) {
      var oldKey = record1.key;
      var newKey = record2.key;
      if (newKey > oldKey) {}
      await _store.delete(_db.instance, finder: finder1);
      await _store.delete(_db.instance, finder: finder2);
      await _store.record(record2.key).add(_db.instance, oldExercise.toJson());
      await _store.record(record1.key).add(_db.instance, newExercise.toJson());
    }
  }
}





// final exerciseDAOProvider = StateProvider((ref) {
//   final db = ref.watch(sembastProvider);
//   return ExerciseDAO(db);
// });
// final futureDAOProvider = FutureProvider((ref) async {
//   final allExercise = await ref.watch(exerciseDAOProvider).getAllExercise();
//   return allExercise;
// });

 // Future<List<Exercise>> getAllExercise() async {
  //   print('Get all exercise fired');
  //   final finder = Finder(sortOrders: [
  //     SortOrder('id'),
  //   ]);
  //   final recordSnapshot = await _store.find(_sembastDatabase.instance, finder: finder);

  //   return recordSnapshot.map((snapshot) {
  //     final exercise = Exercise.fromJson(snapshot.value);
  //     print('Key is ${snapshot.key}');
  //     // exercise.uuid = snapshot.key;
  //     // exercise.id == snapshot.key;
  //     return exercise;
  //   }).toList();
  // }

  // Code snippets for search
// finder: filter!=null && filter.isNotEmpty?
//         Finder(filter: Filter.custom((records)=>(records.value as String).startsWith(filter))):null

// Check reso coder tutorial 23 min