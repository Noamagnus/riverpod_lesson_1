import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/screens/home_page.dart';
import 'package:my_first_riverpod/widgets/navigation_bar_widget.dart';

final initializationProvider = FutureProvider((ref) async {
  await ref.read(sembastProvider).init();
});

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(initializationProvider, (_, b) {});
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationBarWidget(),
      // home: const MyHomePage(title: 'Riverpod'),
    );
  }
}