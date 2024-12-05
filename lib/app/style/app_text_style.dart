import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle riaStyle(double size, double? height) => TextStyle(
        fontFamily: 'ria',
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.02 / 100 * size,
        fontSize: size,
        height: height == null ? null : height / size,
        fontWeight: FontWeight.w800,
      );

  static TextStyle pretendardStyle(double size, double? height) => TextStyle(
        fontFamily: 'pretendard',
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.02 / 100 * size,
        fontSize: size,
        height: height == null ? null : height / size,
      );

  static TextStyle pretendardMediumStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle pretendardSemiBoldStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle pretendardBoldStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w800,
      );

  static final TextStyle highlight = pretendardBoldStyle(32, 36);

  static final TextStyle headline1BoldDeskTop = pretendardBoldStyle(24, 33);
  static final TextStyle headline1BoldMobile = pretendardBoldStyle(20, 27);

  static final TextStyle headline1SemiBoldDeskTop =
      pretendardSemiBoldStyle(24, 33);
  static final TextStyle headline1SemiBoldMobile =
      pretendardSemiBoldStyle(20, 27);

  static final TextStyle headline2DeskTop = pretendardBoldStyle(20, 27);
  static final TextStyle headline2Mobile = pretendardBoldStyle(17, 23);

  static final TextStyle headline3 = pretendardSemiBoldStyle(18, 24);
  static final TextStyle title1 = pretendardBoldStyle(16, 22);

  static final TextStyle title2DeskTop = pretendardSemiBoldStyle(16, 22);
  static final TextStyle title2Mobile = pretendardSemiBoldStyle(14, 20);

  static final TextStyle title3 = pretendardBoldStyle(14, 20);
  static final TextStyle body1 = pretendardSemiBoldStyle(14, 20);

  static final TextStyle body2DeskTop = pretendardMediumStyle(14, 20);
  static final TextStyle body2Mobile = pretendardMediumStyle(12, 18);

  static final TextStyle body3 = pretendardMediumStyle(13, 18);
  static final TextStyle alert1 = pretendardSemiBoldStyle(12, 17);
  static final TextStyle alert2 = pretendardStyle(12, 17);

  static final TextStyle highlightDeskTop = pretendardBoldStyle(50, 56);
  static final TextStyle highlightMobile = pretendardBoldStyle(40, 44);

  static final TextStyle riaHighlightDeskTop = riaStyle(50, 56);
  static final TextStyle riaHeadline1DeskTop = riaStyle(40, 44);

  static final TextStyle riaHighlightMobile = riaStyle(40, 44);
  static final TextStyle riaHeadline1Mobile = riaStyle(32, 36);

  static final TextStyle title1DeskTop = pretendardBoldStyle(30, 36);
}
