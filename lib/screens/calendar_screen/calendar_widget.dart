import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      daysOfWeekHeight: 30,
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (selectDay, focusDay) {
        setState(() {
          selectedDay = selectDay;
          _focusedDay = focusDay;
        });
      },
      // calendarStyle: CalendarStyle(
      //     selectedDecoration: BoxDecoration(
      //   color: Colors.blue,
      // )),
      selectedDayPredicate: (date) {
        return isSameDay(selectedDay, date);
      },
      onPageChanged: (focusedDay) {
  _focusedDay = focusedDay;
},

      // onFormatChanged: (format)=>,
    );
  }
}
