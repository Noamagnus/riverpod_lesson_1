import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/rest_model.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

final restProvider = StateNotifierProvider<RestStateNotifier, Rest>((ref) {
  return RestStateNotifier();
});

class RestStateNotifier extends StateNotifier<Rest> {
  RestStateNotifier()
      : super(Rest(
          uuid: uuid.v4(),
          restTime: 10,
        ));

  Rest getRestState() {
    return state;
  }

  void selectRestFromList(Rest rest) {
    state = rest;
  }

  void setRestingTime(int value) {
    state = state.copyWith(restTime: value);
  }
}
