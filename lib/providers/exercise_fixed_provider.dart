import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/helpers/image_picker.dart';
import 'package:my_first_riverpod/models/exercise_fixed_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
enum ExerciseState { initial, hanging, resting, finished }

final exerciseFixedProvider = StateNotifierProvider<ExerciseStateNotifier, ExerciseFixed>((ref) {
  return ExerciseStateNotifier(ref);
});

class ExerciseStateNotifier extends StateNotifier<ExerciseFixed> {
  ExerciseStateNotifier(this.ref)
      : super(const ExerciseFixed(
          estimatedTime: 1,
          reps: 1,
        ));
  Ref ref; //! to be able to read imagePickerProvider

  void selectExerciseFromList(ExerciseFixed exercise) {
    state = exercise;
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setContinueOnFinishName() {
    state = state.copyWith(continueOnFinish: !state.continueOnFinish);
  }

  void setEstimatedTime(int value) {
    state = state.copyWith(estimatedTime: value);
  }

  void setNumberOfReps(int value) {
    state = state.copyWith(
      reps: value,
    );
  }

  void takePicture() async {
    final exerciseImageUrl = await ref.read(imagePickerProvider).takePicture();
    state = state.copyWith(imageUrl: exerciseImageUrl);
  }

  void showDetails() {
    state = state.copyWith(displayDetails: !state.displayDetails);
  }
}
