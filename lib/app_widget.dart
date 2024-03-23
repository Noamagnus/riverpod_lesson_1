import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/router/router.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseRepo = ExerciseRepo();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: exerciseRepo,
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: ThemeData(primaryColor: kColorPrimaryWhite,
            // textTheme: screenWidth < 500 ? kTextThemeDefault : kTextThemeSmall,
            ),
        // home: const MyHomePage(title: 'Riverpod'),
      ),
    );
  }
}
