import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/app_widget.dart';
import 'package:my_first_riverpod/screens/home_page.dart';

void main() {
  runApp(const ProviderScope(child: AppWidget()));
}


