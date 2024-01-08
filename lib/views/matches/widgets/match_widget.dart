import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';
import 'package:hockey_app/consts/app_text_styles/match_text_style.dart';

import '../../../data/repository/api_repository.dart';

class MatchWidget extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const MatchWidget({Key? key, required this.matchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTeam = matchData['teams']['home'];
    final awayTeam = matchData['teams']['away'];
    final scores = matchData['scores'];
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                  Text(formatDateTime(matchData['date']),
                      style: MatchTextStyle.title),
                  Text(matchData['league']['name'],
                      style: MatchTextStyle.title),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  homeTeam['logo'],
                  width: screenSize.height * 0.05,
                  height: screenSize.height * 0.05,
                ),
                Text(
                  '${scores['home']} - ${scores['away']}',
                  style: MatchTextStyle.score,
                ),
                Image.network(
                  awayTeam['logo'],
                  width: screenSize.height * 0.05,
                  height: screenSize.height * 0.05,
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  homeTeam['name'],
                  style: MatchTextStyle.team,
                ),
                Text(
                  awayTeam['name'],
                  style: MatchTextStyle.team,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
