import 'package:flutter/material.dart';

import '../widgets/header/header_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
          ],
        ),
      ),
    );
  }
}
