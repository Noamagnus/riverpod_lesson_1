import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_riverpod/data/constants/route_names.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';
import 'package:my_first_riverpod/ui/add_exercise_page/add_exercise_page.dart';
import 'package:my_first_riverpod/ui/add_exercise_page/bloc/add_exercise_bloc.dart';
import 'package:my_first_riverpod/ui/analytics_page/analytics_page.dart';
import 'package:my_first_riverpod/ui/calendar_page/calendar_screen.dart';
import 'package:my_first_riverpod/ui/exercise_list_page/bloc/exercise_list_bloc.dart';
import 'package:my_first_riverpod/ui/exercise_list_page/exercise_list_page.dart';
import 'package:my_first_riverpod/ui/home_page/home_page.dart';
import 'package:my_first_riverpod/ui/shell_page/shell_page.dart';
import 'package:my_first_riverpod/ui/splash_page/splash_page.dart';
import 'package:my_first_riverpod/ui/workouts_page/bloc/workouts_bloc.dart';
import 'package:my_first_riverpod/ui/workouts_page/workout_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _workoutsNavigatorKey = GlobalKey<NavigatorState>();
final _calendarNavigatorKey = GlobalKey<NavigatorState>();
final _analyticsNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: RouteNames.splash,
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          // child: const ExerciseListPage(),
          child: const SplashPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: navigationShell,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: ProviderStatefulShell(
                  shell: navigationShell,
                  child: ShellPage(navigationShell: navigationShell),
                ),
              );
            },
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                name: RouteNames.home,
                path: '/home',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _workoutsNavigatorKey,
            routes: [
              GoRoute(
                name: RouteNames.workouts,
                path: '/workouts',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: BlocProvider<WorkoutsBloc>(
                      create: (context) => WorkoutsBloc(),
                      child: const WorkoutsPage(),
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _calendarNavigatorKey,
            routes: [
              GoRoute(
                name: RouteNames.calendar,
                path: '/calendar',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const CalendarPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _analyticsNavigatorKey,
            routes: [
              GoRoute(
                name: RouteNames.analytics,
                path: '/analytics',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const AnalyticsPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ]),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: RouteNames.exerciseList,
      path: '/exerciseList',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<ExerciseListBloc>(
            create: (context) => ExerciseListBloc(exerciseRepo: context.read<ExerciseRepo>()),
            child: const ExerciseListPage(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: RouteNames.addExercise,
      path: '/add_exercise',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider<AddExerciseBloc>(
            create: (context) => AddExerciseBloc(exerciseRepo: context.read<ExerciseRepo>()),
            child: const AddExercisePage(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

class ProviderStatefulShell extends InheritedWidget {
  const ProviderStatefulShell({required this.shell, required super.child, super.key});

  final StatefulNavigationShell shell;

  static ProviderStatefulShell of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProviderStatefulShell>()!;
  }

  @override
  bool updateShouldNotify(covariant ProviderStatefulShell oldWidget) {
    return shell != oldWidget.shell;
  }
}
