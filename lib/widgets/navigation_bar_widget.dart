import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_riverpod/ui/calendar_page/calendar_screen.dart';
import 'package:my_first_riverpod/ui/home_page/home_page.dart';
import 'package:my_first_riverpod/ui/workouts_page/workout_page.dart';

import '../ui/analytics_page/analytics_page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int index = 0;
  final screens = [
    const HomePage(),
    const WorkoutsPage(),
    const CalendarPage(),
    const AnalyticsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60, //Lower than default
          indicatorColor: Colors.lightGreen.shade200,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.running),
              label: 'Workouts',
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.calendar),
              label: 'Calendar',
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.chartBar),
              label: 'Analytics',
            ),
          ],
        ),
      ),
    );
  }
}
