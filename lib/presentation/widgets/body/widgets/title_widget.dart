import 'package:flutter/material.dart';

import '../../../../app/style/app_text_style.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          AppTextStyle.highlightDeskTop.copyWith(color: Colors.grey.shade700),
    );
  }
}
