import 'package:flutter/material.dart';

import '../../../../app/style/app_text_style.dart';
import '../../../../core/enums/screen_type_enum.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final ScreenType type;

  const TitleWidget({required this.title, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle;

    switch (type) {
      case ScreenType.desktop:
        textStyle = AppTextStyle.highlightDeskTop.copyWith(color: Colors.black);
        break;
      case ScreenType.mobile:
        textStyle = AppTextStyle.highlightMobile.copyWith(color: Colors.black);
        break;
      default:
        textStyle = AppTextStyle.highlightDeskTop.copyWith(color: Colors.black);
    }

    return Text(
      title,
      style: textStyle,
    );
  }
}
