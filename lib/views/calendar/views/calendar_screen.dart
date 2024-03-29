import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';
import 'package:hockey_app/consts/app_text_styles/onboarding_text_style.dart';

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
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<dynamic> _selectedDayMatches = [];
  final ApiRepository apiRepository = ApiRepository();
  bool _isLoading = true;

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
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Calendar',
            style: OnboardingTextStyle.screenTitle),
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: <Widget>[
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.lightBlueColor,
                ),
              ),
            if (!_isLoading && _selectedDayMatches.isEmpty)
              const Text('Error: Matches aren\'t found'),
            if (!_isLoading && _selectedDayMatches.isNotEmpty)
              CalendarMatchWidget(matchData: _selectedDayMatches[0]),
            if (!_isLoading && _selectedDayMatches.length > 1)
              CalendarMatchWidget(matchData: _selectedDayMatches[1]),
            const Spacer(),
            TableCalendar(
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
                leftChevronIcon:
                    Icon(Icons.chevron_left, color: AppColors.lightGreyColor),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: AppColors.lightGreyColor),
                formatButtonVisible: false,
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColors.lightGreyColor,
                ),
                weekendStyle: TextStyle(color: AppColors.lightBlueColor),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle:
                    const TextStyle(color: AppColors.lightGreyColor),
                weekendTextStyle:
                    const TextStyle(color: AppColors.lightBlueColor),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.lightBlueColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppColors.lightBlueColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
