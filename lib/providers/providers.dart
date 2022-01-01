import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/bottom_navigation.dart';
import 'package:my_first_riverpod/services/services.dart';

//! This is cases of different providers

final futureProvider = FutureProvider<int>((ref) => fetchWeather());
final counterProvider = StateProvider<int>((ref) => 0);
final streamProvider = StreamProvider<String>(
  (ref) => Stream.periodic(
    const Duration(microseconds: 400),
    (x) => x.toString(),
  ),
);

final bottomNavigationBarProvider =
    StateNotifierProvider<BottomNavigationNotifier, BottomNavigationModel>(
        (ref) => BottomNavigationNotifier());





class BottomNavigationNotifier extends StateNotifier<BottomNavigationModel> {
  BottomNavigationNotifier() : super(BottomNavigationModel());

  void setIndex(int newIndex) {
    final newState = state.copyWith(index: newIndex);
    state = newState;
  }
}


