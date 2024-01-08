import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';

import '../../../data/repository/api_repository.dart';

class MatchWidget extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const MatchWidget({Key? key, required this.matchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTeam = matchData['teams']['home'];
    final awayTeam = matchData['teams']['away'];
    final scores = matchData['scores'];

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
                  Text(
                    formatDateTime(matchData['date']),
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  Text(
                    matchData['league']['name'],
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  homeTeam['logo'],
                  width: 40,
                  height: 40,
                ),
                Text(
                  '${scores['home']} - ${scores['away']}',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                Image.network(
                  awayTeam['logo'],
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  homeTeam['name'],
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                Text(
                  awayTeam['name'],
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
