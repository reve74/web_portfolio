import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../app/style/app_text_style.dart';

class HeaderContain extends StatelessWidget {
  const HeaderContain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const Expanded(flex: 3, child: HeaderBody()),
            // Expanded(flex: 2, child: Image.asset("assets/images/pizza2.png"))
          ],
        )
      ],
    );
  }
}

// for mobile
class MobileHeaderContain extends StatelessWidget {
  const MobileHeaderContain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset(
        //   "assets/images/pizza2.png",
        //   height: 300,
        //   width: 350,
        // ),
        const HeaderBody()
      ],
    );
  }
}

class HeaderBody extends StatelessWidget {
  const HeaderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: 'Flutter 개발자 ',
              // text: 'Lorem Ipsum',
              style:
                  AppTextStyle.highlightDeskTop.copyWith(color: Colors.black),
              children: const [
                TextSpan(
                  text: '윤준호',
                  // text:
                  //     'Neque porro quisquam est qui dolorem',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // TextSpan(text: '입니다.'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Search your favorite items",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: OutlinedButton(
            style:
                OutlinedButton.styleFrom(backgroundColor: Colors.amberAccent),
            onPressed: () {},
            child: const Text(
              "Order Now",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
