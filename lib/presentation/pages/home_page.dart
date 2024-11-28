import 'package:flutter/material.dart';
import 'package:web_portfolio/app/style/app_text_style.dart';
import 'package:gap/gap.dart';
import 'package:web_portfolio/presentation/widgets/head/my_drawer.dart';

import '../widgets/head/header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderSection(),
        

          ],
        ),
      ),
    );
  }
}
