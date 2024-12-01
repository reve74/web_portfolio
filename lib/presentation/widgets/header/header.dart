import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../app/style/app_text_style.dart';
import '../../../core/constants.dart';
import '../../../core/responsive/responsive.dart';
import 'header_web_menu.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => desktopHeader(),
      mobile: (_) => desktopHeader(),
      tablet: (_) => desktopHeader(),
    );
  }

  Widget desktopHeader() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: 'Hello, I\'m ',
              style:
              AppTextStyle.highlightDeskTop.copyWith(color: Colors.black),
              children: const [
                TextSpan(
                  text: 'Junho ',

                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'Flutter Developer.'),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/me.jpg"),
              minRadius: 30,
            ),
            const Gap(30),
            contactIcon(
              iconData: FontAwesomeIcons.solidEnvelope,
              url: "reve99@naver.com",
              tooltip: "Email",
            ),
            contactIcon(
              iconData: FontAwesomeIcons.github,
              url: "https://github.com/reve74",
              tooltip: "GitHub profile",
            ),
            contactIcon(
              iconData: FontAwesomeIcons.linkedinIn,
              url: Constants.linkedInUrl,
              tooltip: "LinkedIn profile",
            ),
          ],
        ),
      ],
    );
  }

  Widget contactIcon({
    required IconData iconData,
    required String url,
    required String tooltip,
  }) {
    return IconButton(
      onPressed: () {
        launchUrlString(url);
      },
      tooltip: tooltip,
      icon: FaIcon(
        iconData,
        size: Constants.faIconSizeRegular,
      ),
    );
  }
}
