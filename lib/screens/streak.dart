import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class StreakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streak Calendar',
      theme: ThemeData(primarySwatch: Colors.green),
      home: StreakCalendar(),
    );
  }
}

class StreakCalendar extends StatefulWidget {
  @override
  _StreakCalendarState createState() => _StreakCalendarState();
}

class _StreakCalendarState extends State<StreakCalendar> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  final Map<DateTime, bool> _streaks = {
    DateTime(2023, 9, 1): true,
    DateTime(2023, 9, 2): true,
    DateTime(2023, 9, 3): true,
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  bool _isStreak(DateTime day) {
    return _streaks[day] ?? false;
  }

  void _markTodayAsActivity() {
    final today = DateTime.now();
    setState(() {
      _streaks[today] = true; // Mark today as a streak day
    });
  }

  bool _hasCompletedActivityToday() {
    final today = DateTime.now();
    return _streaks.containsKey(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streak Calendar'),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: _hasCompletedActivityToday() ? Colors.green : Colors.black),
            onPressed: () {
              if (_hasCompletedActivityToday()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Activity completed today!')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No activity recorded for today.')),
                );
              }
            },
          ),
        ],
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: _isStreak(day) ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: _isStreak(day) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _markTodayAsActivity,
        child: Icon(Icons.check),
        backgroundColor: _hasCompletedActivityToday() ? Colors.green : Colors.blue,
      ),
    );
  }
}
