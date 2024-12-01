import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_portfolio/app/style/app_theme.dart';

import 'core/constants.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const App());

  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(
      desktop: (Constants.halfScreenWidth + Constants.globalPadding) * 2,
      tablet: 880,
      watch: 200,
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Builder(
          builder: (context) {
            EasyLoading.init();
            return Overlay(initialEntries: [
              OverlayEntry(
                builder: (context) => HomePage(),
              )
            ]);
          },
        );
      },
    );
  }
}
