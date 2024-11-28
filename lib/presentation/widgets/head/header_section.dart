import 'package:flutter/material.dart';

import '../../../core/responsive/responsive.dart';
import 'header.dart';
import 'header_contain.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 1233),
            child: Column(
              children: [
                // Header icon and name
                const Header(),
                Responsive.isDesktop(context)
                    ? const HeaderContain()
                    : const MobileHeaderContain(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
