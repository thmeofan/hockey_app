import 'package:flutter/material.dart';
import 'package:hockey_app/consts/app_colors.dart';

import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../data/repository/api_repository.dart';
import '../widgets/match_widget.dart';

class MatchesScreen extends StatelessWidget {
  final ApiRepository apiRepository = ApiRepository();

  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches Screen',
            style: OnboardingTextStyle.screenTitle),
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: FutureBuilder<List<dynamic>>(
          future: apiRepository.fetchMatches('2024-01-08'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.lightBlueColor,
              ));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return MatchWidget(matchData: snapshot.data![index]);
                },
              );
            } else {
              return const Text('No matches found');
            }
          },
        ),
      ),
    );
  }
}
