Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 5));
  throw Exception('Not so fast!!!');
}