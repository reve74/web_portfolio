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
          // constraints: const BoxConstraints(maxWidth: 1233),
          child: Column(
            children: [
              const Header(),
              // Responsive.isDesktop(context) ?
              // const HeaderContain()
              // : const MobileHeaderContain(),
            ],
          ),
        )
      ],
    );
  }
}
