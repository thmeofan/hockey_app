import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Future<void> _launchURL() async {
  //   Uri url = Uri.parse('https://google.com/');
  //   if (await canLaunchUrl(url)) {
  //     final bool launched = await launchUrl(
  //       url,
  //       mode: LaunchMode.externalApplication,
  //     );
  //     if (!launched) {
  //       throw 'Could not launch $url';
  //     }
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.blackColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    //  _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightGreyColor,
                  ),
                  label: const Text(
                    'Privacy Policy',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    //  _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/clipboard.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightGreyColor,
                  ),
                  label: const Text(
                    'Terms of use',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    //  _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/info.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightGreyColor,
                  ),
                  label: const Text(
                    'Subscription info',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    //  _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/star.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightGreyColor,
                  ),
                  label: const Text(
                    'Rate app',
                    style: OnboardingTextStyle.introduction,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
