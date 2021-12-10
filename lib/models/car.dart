class Car {
  String? name;
  double? doors;
  int? speed;
  Car({
     this.name='Test',
     this.doors=1,
     this.speed=0,
  });
  

  Car copyWith({
    String? name,
    double? doors,
    int? speed,
  }) {
    return Car(
      name: name ?? this.name,
      doors: doors ?? this.doors,
      speed: speed ?? this.speed,
    );
  }
}
