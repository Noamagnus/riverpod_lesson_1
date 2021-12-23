import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositiries/sambased.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

// final exerciseDAOProvider = StateProvider((ref) {
//   final db = ref.watch(sembastProvider);
//   return ExerciseDAO(db);
// });
// final futureDAOProvider = FutureProvider((ref) async {
//   final allExercise = await ref.watch(exerciseDAOProvider).getAllExercise();
//   return allExercise;
// });
final exerciseDAOProvider = StateNotifierProvider<ExerciseDAONotifier, ExerciseDAO>((ref) {
  final db = ref.watch(sembastProvider);

  return ExerciseDAONotifier(db);
});

class ExerciseDAONotifier extends StateNotifier<ExerciseDAO> {
  // final db = ref.watch(sembastProvider);
  ExerciseDAONotifier(db) : super(ExerciseDAO(db));
}

Uuid _uuid = const Uuid();

class ExerciseDAO {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('exercise1');
  // final _store2 = StoreRef<int, String>('Kurac');
  ExerciseDAO(
    this._sembastDatabase,
  );
  Future<void> saveExercise(Exercise exercise) async {
    final newExercise = exercise.copyWith(uuid: _uuid.v4());
    await _store.add(_sembastDatabase.instance, newExercise.toJson());
    // await _store.record().put(_sembastDatabase.instance, exercise.toJson());
  }
// Code snippets for search
// finder: filter!=null && filter.isNotEmpty?
//         Finder(filter: Filter.custom((records)=>(records.value as String).startsWith(filter))):null

// Check reso coder tutorial 23 min
  Stream<List<Exercise>> getAllExercises2({String? filter}) {
    return _store
        .query()
        .onSnapshots(_sembastDatabase.instance)
        .map((records) => records.map((snapshot) {
              final exercise = Exercise.fromJson(snapshot.value);
              exercise.id == snapshot.key;
              return exercise;
            }).toList());
  }

  Future<List<Exercise>> getAllExercise() async {
    print('Get all exercise fired');
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);
    final recordSnapshot = await _store.find(_sembastDatabase.instance, finder: finder);

    return recordSnapshot.map((snapshot) {
      final exercise = Exercise.fromJson(snapshot.value);
      // exercise.uuid = snapshot.key;
      // exercise.id == snapshot.key;
      return exercise;
    }).toList();
  }

  Future<void> deleteExercise(Exercise exercise) async {
    print('deleteExercise fired');
    //  final finder = Finder(filter: Filter.byKey(exercise.id)); //old code
    final finder = Finder(filter: Filter.equals('uuid', exercise.uuid));
    await _store.delete(_sembastDatabase.instance, finder: finder);
  }

  Future<void> updateExercise(Exercise exercise) async {
    final finder = Finder(filter: Filter.byKey(exercise.id)); //old code
    // final finder = Finder(filter: Filter.byKey(exercise.uuid));//old code
    await _store.update(_sembastDatabase.instance, exercise.toJson(), finder: finder);
  }
}
