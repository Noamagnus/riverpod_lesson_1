import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/repositories/sambased.dart';

final sembastProvider = Provider((ref) {
  return SembastDatabase();
});