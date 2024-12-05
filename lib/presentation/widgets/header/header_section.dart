import 'package:flutter/material.dart';

import 'header.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Header(),
            ],
          ),
        )
      ],
    );
  }
}
