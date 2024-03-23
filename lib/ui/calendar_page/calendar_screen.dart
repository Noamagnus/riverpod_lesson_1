import 'package:flutter/material.dart';
import 'package:my_first_riverpod/ui/calendar_page/calendar_widget.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.lightGreen.shade200,
      body: SingleChildScrollView(child: CalendarWidget()),
    );
  }
}
