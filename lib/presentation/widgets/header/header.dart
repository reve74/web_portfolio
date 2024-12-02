import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_portfolio/presentation/widgets/body/body_section.dart';

import '../../../app/style/app_text_style.dart';
import '../../../core/constants.dart';

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
    return SizedBox(
      child: Column(
        children: [
          const Gap(80),
          Text(
            'Hello, I\'m',
            style:
                AppTextStyle.riaHighlightDeskTop.copyWith(color: Colors.black),
          ),
          const Gap(10),
          Text(
            'Junho',
            style:
                AppTextStyle.riaHighlightDeskTop.copyWith(color: Colors.black),
          ),
          const Gap(10),
          Text(
            'Flutter Developer.',
            style:
                AppTextStyle.riaHeadline1DeskTop.copyWith(color: Colors.black),
          ),
          BodySection(),
        ],
      ),
    );
  }
}
