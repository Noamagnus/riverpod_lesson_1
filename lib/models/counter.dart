//! Lets try StateNotifier thing
class Counter {
  int counts;
  int doubleCounts;
  Counter({
    this.counts = 0,
    this.doubleCounts = 20,
  });

  // Counter copyWith({
  //   int? counts,
  // }) {
  //   return Counter(
  //     counts: counts ?? this.counts,
  //   );
  // }
}