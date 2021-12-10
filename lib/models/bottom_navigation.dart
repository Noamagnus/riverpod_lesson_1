class BottomNavigationModel {
  int index;

  BottomNavigationModel({
    this.index = 0,
  });

  // void setIndex(int newIndex) {
  //   index = newIndex;
  // }

  BottomNavigationModel copyWith({
    int? index,
  }) {
    return BottomNavigationModel(
      index: index ?? this.index,
    );
  }
}
