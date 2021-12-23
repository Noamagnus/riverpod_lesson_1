import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/bottom_navigation.dart';
import 'package:my_first_riverpod/models/car.dart';
import 'package:my_first_riverpod/models/counter.dart';
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
final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, Counter>((ref) => CounterNotifier());
final bottomNavigationBarProvider =
    StateNotifierProvider<BottomNavigationNotifier, BottomNavigationModel>(
        (ref) => BottomNavigationNotifier());

final carProvider = StateNotifierProvider<CarNotifier, Car>((ref) {
  return CarNotifier();
});

class CarNotifier extends StateNotifier<Car> {
  CarNotifier() : super(Car());

  void doors(double doors) {
    state = state.copyWith(doors: doors);
  }

}

class BottomNavigationNotifier extends StateNotifier<BottomNavigationModel> {
  BottomNavigationNotifier() : super(BottomNavigationModel());

  void setIndex(int newIndex) {
    final newState = state.copyWith(index: newIndex);
    state = newState;
  }
}

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter());

  // void increment(int counter) {
  //   final newCounts = state.counts + 1;
  //   final newState = state.copyWith(counts: newCounts);
  //   state = newState;
  // }
  void increment() {
    state.counts++;
    state.doubleCounts += 20;
  }
}
