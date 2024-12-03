import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../app/style/app_text_style.dart';
import '../body/body_section.dart';

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
          const Gap(20),
          Text(
            'Junho',
            style:
                AppTextStyle.riaHighlightDeskTop.copyWith(color: Colors.black),
          ),
          const Gap(20),
          Text(
            'Flutter Developer.',
            style:
                AppTextStyle.riaHeadline1DeskTop.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
