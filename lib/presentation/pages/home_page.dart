import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_portfolio/app/style/app_text_style.dart';
import 'package:web_portfolio/presentation/widgets/body/body_section.dart';

import '../../core/enums/screen_type_enum.dart';
import '../widgets/header/header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenTypeLayout.builder(
      desktop: (_) => _desktopLayout(ScreenType.desktop),
      tablet: (_) => _desktopLayout(ScreenType.mobile),
      mobile: (_) => _mobileLayout(),
    ));
  }

  Widget _desktopLayout(ScreenType type) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderSection(),
                  BodySection(ScreenType.desktop),
                ],
              ),
            ),
          ),
        ),
        if (type == ScreenType.desktop)
          Positioned(
            top: 50,
            left: 80,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _navigationButton(
                    title: 'About Me',
                    onPressed: () {
                      Scrollable.ensureVisible(
                        profileKey.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                  _navigationButton(
                    title: 'Career',
                    onPressed: () {
                      Scrollable.ensureVisible(
                        careerKey.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                  _navigationButton(
                    title: 'Projects',
                    onPressed: () {
                      Scrollable.ensureVisible(
                        projectKey.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderSection(),
          BodySection(ScreenType.mobile),
        ],
      ),
    );
  }

  Widget _navigationButton(
      {required String title, required Function() onPressed}) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.grey.shade500;
            }
            return Colors.grey.shade400;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyle.title1DeskTop,
      ),
    );
  }
}
