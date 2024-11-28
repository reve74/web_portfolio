import 'package:flutter/material.dart';

import '../../../core/responsive/responsive.dart';
import 'header_web_menu.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          // For mobile
          if (!Responsive.isDesktop(context))
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          if (Responsive.isDesktop(context)) const HeaderWebMenu(),
          // const Spacer(),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.deepPurple,
          //       elevation: 17,
          //       minimumSize: const Size(25, 44)),
          //   onPressed: () {},
          //   child: const Text(
          //     "Join",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
