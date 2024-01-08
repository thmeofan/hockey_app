import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_app/views/community/views/community_screen.dart';
import '../../../consts/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../../calendar/views/calendar_screen.dart';
import '../../matches/views/matches_screen.dart';
import '../../settings/views/settings_screen.dart';
import '../../sport_news/views/sport_news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    MatchesScreen(),
    SportNewsScreen(
      newsModel: news,
    ),
    CommunityScreen(),
    const CalendarScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/matches.svg',
              width: 80.0,
              height: 40.0,
              color: currentIndex == 0
                  ? AppColors.lightBlueColor
                  : AppColors.lightGreyColor,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/sport_news.svg',
              width: 80.0,
              height: 40.0,
              color: currentIndex == 1
                  ? AppColors.lightBlueColor
                  : AppColors.lightGreyColor,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/community.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 2
                    ? AppColors.lightBlueColor
                    : AppColors.lightGreyColor,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 3
                    ? AppColors.lightBlueColor
                    : AppColors.lightGreyColor,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 80.0,
                height: 40.0,
                color: currentIndex == 4
                    ? AppColors.lightBlueColor
                    : AppColors.lightGreyColor,
              ),
              label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkGreyColor,
        unselectedItemColor: AppColors.lightGreyColor,
        selectedItemColor: AppColors.lightBlueColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          color: AppColors.lightBlueColor,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.lightGreyColor,
        ),
      ),
    );
  }
}
