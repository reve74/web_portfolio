import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_portfolio/core/enums/screen_type_enum.dart';

import '../../../app/style/app_text_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => desktopHeader(ScreenType.desktop),
      tablet: (_) => desktopHeader(ScreenType.desktop),
      mobile: (_) => desktopHeader(ScreenType.mobile),
    );
  }

  Widget desktopHeader(ScreenType type) {
    final TextStyle titleText1;
    final TextStyle titleText2;

    switch (type) {
      case ScreenType.desktop:
        titleText1 =
            AppTextStyle.riaHighlightDeskTop.copyWith(color: Colors.black);
        break;
      case ScreenType.mobile:
        titleText1 =
            AppTextStyle.riaHighlightMobile.copyWith(color: Colors.black);
        break;
      default:
        titleText1 =
            AppTextStyle.riaHighlightDeskTop.copyWith(color: Colors.black);
    }

    switch (type) {
      case ScreenType.desktop:
        titleText2 =
            AppTextStyle.riaHeadline1DeskTop.copyWith(color: Colors.black);
        break;
      case ScreenType.mobile:
        titleText2 =
            AppTextStyle.riaHeadline1Mobile.copyWith(color: Colors.black);
        break;
      default:
        titleText2 =
            AppTextStyle.riaHeadline1DeskTop.copyWith(color: Colors.black);
    }

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(80),
          Text(
            'Hello, I\'m',
            style: titleText1,
          ),
          const Gap(20),
          Text('Junho', style: titleText1),
          const Gap(20),
          Text(
            'Flutter Developer.',
            style: titleText2,
          ),
        ],
      ),
    );
  }
}
