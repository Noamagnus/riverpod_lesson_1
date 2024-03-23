import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60, //Lower than default
          indicatorColor: Colors.lightGreen.shade200,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (selectedIndex) {
            widget.navigationShell.goBranch(selectedIndex);
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
