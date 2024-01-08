import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/models/news_model.dart';
import '../data/repository/onboarding_repository.dart';
import '../views/app/views/home_screen.dart';
import '../views/onboarding_screen/view/onboarding_screen.dart';
import '../views/sport_news/views/article_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const categories = 'categories';
  static const community = 'community';
  static const news = 'news';
  static const calendar = 'calendar';
  static const settings = 'settings';
  static const matches = 'matches';
  static const article = 'article';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = const HomeScreen();
      // case quiz:
      //   List<Question> questions = settings.arguments as List<Question>;
      //   void resetQuestions() {
      //     for (var question in questions) {
      //       question.isLocked = false;
      //       question.selectedOption = null;
      //     }
      //   }
      //   child = QuizScreen(
      //     questions: questions,
      //     onRetakeQuiz: resetQuestions,
      //   );
      case article:
        NewsModel news = settings.arguments as NewsModel;
        child = ArticleScreen(
          newsModel: news,
        );
      // case home:
      //   child = HomeScreen();
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
