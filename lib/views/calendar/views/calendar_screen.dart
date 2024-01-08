import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/repository/api_repository.dart';
import '../widgets/calendar_match_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<dynamic> _selectedDayMatches = [];
  final ApiRepository apiRepository = ApiRepository();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _fetchMatchesForSelectedDate();
  }

  void _fetchMatchesForSelectedDate() async {
    final dateString = DateFormat('yyyy-MM-dd').format(_selectedDay!);
    final matches = await apiRepository.fetchMatches(dateString);
    setState(() {
      _selectedDayMatches = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Calendar'),
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: <Widget>[
            if (_selectedDayMatches.isNotEmpty)
              CalendarMatchWidget(matchData: _selectedDayMatches[0]),
            if (_selectedDayMatches.length > 1)
              CalendarMatchWidget(matchData: _selectedDayMatches[1]),
            TableCalendar(
              firstDay: DateTime.utc(2015, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _selectedDayMatches = [];
                  });
                  _fetchMatchesForSelectedDate();
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _selectedDayMatches.length,
                itemBuilder: (context, index) {
                  return CalendarMatchWidget(
                      matchData: _selectedDayMatches[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
