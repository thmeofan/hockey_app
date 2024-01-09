import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';
import 'package:hockey_app/consts/app_text_styles/calendar_text_style.dart';

import '../../../data/repository/api_repository.dart';

class CalendarMatchWidget extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const CalendarMatchWidget({Key? key, required this.matchData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTeam = matchData['teams']['home'];
    final awayTeam = matchData['teams']['away'];
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'date:',
                    style: CalendarTextStyle.dateTitle,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.01,
                  ),
                  Text(
                    formatDateTimeCalendar(matchData['date']),
                    style: CalendarTextStyle.date,
                  ),
                  const Spacer(),
                  const Text(
                    'Match:',
                    style: CalendarTextStyle.dateTitle,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.01,
                  ),
                  Text(
                    matchData['league']['name'],
                    style: CalendarTextStyle.date,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.width * 0.01,
            ),
            Padding(
              padding: EdgeInsets.all(
                screenSize.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    homeTeam['logo'],
                    width: screenSize.height * 0.05,
                    height: screenSize.height * 0.05,
                  ),
                  const Text(
                    'VS',
                    style: CalendarTextStyle.vs,
                  ),
                  Image.network(
                    awayTeam['logo'],
                    width: screenSize.height * 0.05,
                    height: screenSize.height * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  homeTeam['name'],
                  style: CalendarTextStyle.team,
                ),
                Text(
                  awayTeam['name'],
                  style: CalendarTextStyle.team,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
