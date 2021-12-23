import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/repositiries/sambased.dart';
import 'package:sembast/sembast.dart';

final sembastProvider = Provider((ref) {
  return SembastDatabase();
});